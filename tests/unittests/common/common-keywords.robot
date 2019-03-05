*** Settings ***
##  Libraries and resource files 
Resource        rasta.robot
#  Our core rasta keyword libraries and resource files
Library         OperatingSystem
#  Provide some useful keywords to interact with the OS (like to run a command
#  or to create directories)
Library         Collections
Library         XML

*** Keywords ***
#######
# NSO #
#######

Sync NSO devices configurations on ${device}
    [Documentation]   Perform a Sync-from action for all devices in NSO
    [Tags]  NSO
    @{return} =    via NSO REST API configure device "${device}" at URI "/api/operations/devices/sync-from" using "POST" with "xml" payload ""
    ${xml} =   Get From List  ${return}  1
    Should Not Contain Any  ${xml}  false  ERROR  error

Connect to device ${device} using NSO
    [Documentation]   Try to connect to a device using NSO
    [Tags]  NSO
    @{return} =    via NSO REST API configure device "${nso}" at URI "/api/operations/devices/device/${device}/connect" using "POST" with "xml" payload ""
    ${xml} =   Get From List  ${return}  1
    Should Not Contain Any  ${xml}  false  ERROR  error

Load merge payload ${payload} into NSO
    [Tags]  NSO
    via NSO REST API configure device "${nso}" at URI "/api/running" using "PATCH" with "xml" payload "${payload}"

Load merge file ${file} into NSO
    [Tags]  NSO
    ${payload}=   Get File   ${file}
    via NSO REST API configure device "${nso}" at URI "/api/running" using "PATCH" with "xml" payload "${payload}"

###########
# Service #
###########

Create NSO Service using payload ${payload}
    [Documentation]   Creates a service instance in NSO via REST
    [Tags]  service
    via NSO REST API configure device "${nso}" at URI "/api/running" using "PATCH" with "xml" payload "${payload}"


Create Service ${file}
    [Documentation]   Creates a service instance on NSO via REST
    [Tags]  service
    ${payload}=   Get File   ${file}
    via NSO REST API configure device "${nso}" at URI "/api/running" using "PATCH" with "xml" payload "${payload}"

Delete Service ${path}
    [Documentation]   Delete a service instance on NSO via REST
    [Tags]  service
    via NSO REST API configure device "${nso}" at URI "/api/running${path}" using "DELETE" with "xml" payload ""


###########
# Devices #
###########

Save ${step}-service Nokia SR-OS device ${name} configuration
    Create Directory  cases-files/${cfgdir}/cfg/tmp
    Remove File       cases-files/${cfgdir}/cfg/tmp/${step}
    Save configuration from Nokia SR-OS device ${name} to ${step} in ${cfgdir}/tmp

Save ${step}-service Cisco IOS-XR device ${name} configuration
    Create Directory  cases-files/${cfgdir}/cfg/tmp
    Remove File       cases-files/${cfgdir}/cfg/tmp/${step}
    Save configuration from Cisco IOS-XR device ${name} to ${step} in ${cfgdir}/tmp

Save ${step}-service Cisco IOS device ${name} configuration in ${cfgdir}
    Create Directory  cases-files/${cfgdir}/cfg/tmp
    Remove File       cases-files/${cfgdir}/cfg/tmp/${step}
    Save configuration from Cisco IOS device ${name} to ${step} in cases-files/${cfgdir}/cfg/tmp

Compare config expect "${expectAdd}" to be added and "${expectRemove}" removed in ${cfgdir}
    Compare config "cases-files/${cfgdir}/cfg/tmp/pre" to "cases-files/${cfgdir}/cfg/tmp/post" expect "${expectAdd}" to be added and "${expectRemove}" removed


Save configuration from Cisco IOS-XR device ${device} to ${file} in ${dir}
    [Tags]  device
    ${uri} =        Set Variable  /api/operational/devices/device/${device}/live-status/cisco-ios-xr-stats:exec/_operations/show
    ${payload} =    Set Variable  <input><args>running-config</args></input>
    @{return} =	    Nso Interact Via Rest  REST  ${nso}  ${uri}  POST  xml  ${payload}  {"Content-type": "application/vnd.yang.operation+xml"}
    ${code} =       Get From List  ${return}  0
    Should Be Equal As Integers    ${code}  200  Could not retrieve device ${device} configuration, status code
    ${xml} =        Get From List  ${return}  1
    ${element} =    Parse XML  ${xml}
    ${conf} =       Get Element Text  ${element}  result
    Create File     ${dir}/${file}  ${conf}

Save configuration from Cisco IOS device ${device} to ${file} in ${dir}
    [Tags]  device
    ${uri} =        Set Variable  /api/operational/devices/device/${device}/live-status/ios-stats:exec/_operations/show
    ${payload} =    Set Variable  <input><args>running-config</args></input>
    @{return} =	    Nso Interact Via Rest  REST  ${nso}  ${uri}  POST  xml  ${payload}  {"Content-Type: application/vnd.yang.operation+xml"}
    ${code} =       Get From List  ${return}  0
    Should Be Equal As Integers    ${code}  200  Could not retrieve device ${device} configuration, status code
    ${xml} =        Get From List  ${return}  1
    ${element} =    Parse XML  ${xml}
    ${conf} =       Get Element Text  ${element}  result
    Create File     ${dir}/${file}  ${conf}


Save configuration from Nokia SR-OS device ${device} to ${file} in ${dir}
    [Tags]  device
    ${uri} =    Set Variable  /api/operational/devices/device/${device}/live-status/alu-stats:exec/_operations/admin
    ${payload} =    Set Variable  <input><args>display-config</args></input>
    @{return} =    Nso Interact Via Rest  REST  ${nso}  ${uri}  POST  xml  ${payload}  {"Content-type": "application/vnd.yang.operation+xml"}
    ${code} =   Get From List  ${return}  0
    Should Be Equal As Integers    ${code}  200  Could not retrieve device ${device} configuration, status code
    ${xml} =   Get From List  ${return}  1
    ${element} =  Parse XML  ${xml}
    ${conf} =  Get Element Text  ${element}  result
    Create File   ${dir}/${file}  ${conf}

Push configuration using NSO for device ${device}
    [Documentation]   Push device configuration using NSO via REST
    [Tags]  device
    Log to Console     Configuring device ${device}...
    ${payload}=   Get File   configs/${device}.xml
    via NSO REST API configure device "${nso}" at URI "/api/running" using "PATCH" with "xml" payload "${payload}"

Fetch device ${device} SSH host keys
    [Tags]  device
    Log to Console     Fetch SSH host keys of device ${device}...
    ${uri} =    Set Variable  /api/running/devices/device/${device}/ssh/_operations/fetch-host-keys
    via NSO REST API configure device "${nso}" at URI "${uri}" using "POST" with "xml" payload ""