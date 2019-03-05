*** Settings ***
Library    OperatingSystem
Library    Collections

Resource   ./common/common-keywords.robot
Resource   rasta.robot

Variables   config.yaml
Variables   ./cases-files/03-l2vpn-vpls/case-config.yaml

*** Test Cases ***

create l2vpn using REST API in vpls mode with single vlan
    use testbed "${testbed}"
    retrieve latest NSO rollback number from "${nso}"
    Save pre-service Cisco IOS device ${ios_device_1} configuration in ${testdir1}
    Save pre-service Cisco IOS device ${ios_device_2} configuration in ${testdir2}
    # Save pre-service Cisco IOS device ${junos_device_1} configuration in ${testdir}
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "POST" with "json" payload "${service.l2vpn.createPayload.vpls_single_vlan}" and expect "" in response
    Save post-service Cisco IOS device ${ios_device_1} configuration in ${testdir1}
    Save post-service Cisco IOS device ${ios_device_2} configuration in ${testdir2}
    # Save pre-service Cisco IOS device ${junos_device_1} configuration in ${testdir}

validate created configuration in ios1 for l2vpn creation in vpls mode with single vlan
    Compare config expect "${diff.expectedAddSingleVLan.iosdevice1.vpls}" to be added and "" removed in ${testdir1}

validate created configuration in ios2 for l2vpn creation in vpls mode with single vlan
    Compare config expect "${diff.expectedAddSingleVLan.iosdevice2.vpls}" to be added and "" removed in ${testdir2}

delete l2vpn created in vpls mode with single vlan
    Delete Service ${service.l2vpn.deleteSingleVlanService}

create l2vpn using REST API in vpls mode with multiple vlan
    Save pre-service Cisco IOS device ${ios_device_1} configuration in ${testdir1}
    Save pre-service Cisco IOS device ${ios_device_2} configuration in ${testdir2}
    # Save pre-service Cisco IOS device ${junos_device_1} configuration in ${testdir}
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "POST" with "json" payload "${service.l2vpn.createPayload.vpls_multiple_vlan}" and expect "" in response
    Save post-service Cisco IOS device ${ios_device_1} configuration in ${testdir1}
    Save post-service Cisco IOS device ${ios_device_2} configuration in ${testdir2}
    # Save post-service Cisco IOS device ${junos_device_1} configuration in ${testdir}

validate created configuration in ios1 for l2vpn creation in vpls mode with multiple vlan
    Compare config expect "${diff.expectedAddMultipleVLan.iosdevice1.vpls}" to be added and "" removed in ${testdir1}

validate created configuration in ios2 for l2vpn creation in vpls mode with multiple vlan
    Compare config expect "${diff.expectedAddMultipleVLan.iosdevice2.vpls}" to be added and "" removed in ${testdir2}

delete l2vpn created in vpls mode with multiple vlan
    Delete Service ${service.l2vpn.deleteMultipleVlanService}

(Negative) create l2vpn using REST API in vpls mode with only one device
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "POST" with "json" payload "${service.l2vpn.createPayload.vplsOneDevice}" and expect "${negative.vplsOneDeviceExpectedOutput}" in response

(Negative) create l2vpn using REST API providing non-public IP address in input parameter
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "POST" with "json" payload "${service.l2vpn.createPayload.invalidIP}" and expect "${negative.invalidIPExpectedOutput}" in response

(Negative) create l2vpn using REST API providing invalid device
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "POST" with "json" payload "${service.l2vpn.createPayload.invalidDevice}" and expect "${negative.invalidDeviceExpectedOutput}" in response


Rollback device configs
    rollback NSO "${nso}" to rollback retrieved

*** Keywords ***

