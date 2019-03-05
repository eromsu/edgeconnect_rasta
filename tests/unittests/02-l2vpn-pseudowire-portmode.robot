*** Settings ***
Library    OperatingSystem
Library    Collections

Resource   ./common/common-keywords.robot
Resource   rasta.robot

Variables   config.yaml
Variables   ./cases-files/02-l2vpn-pseudowire-portmode/case-config.yaml

*** Test Cases ***

create l2vpn using REST API in port mode
    use testbed "${testbed}"
    retrieve latest NSO rollback number from "${nso}"
    Save pre-service Cisco IOS device ${ios_device} configuration in ${testdir}
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "POST" with "json" payload "${service.l2vpn.createPayload.portmode}" and expect "" in response
    Save post-service Cisco IOS device ${ios_device} configuration in ${testdir}

validate created configuration for l2vpn creation in port mode
    Compare config expect "${diff.expectedAdd.ios.portmode}" to be added and "" removed in ${testdir}

delete l2vpn created in port mode
    Delete Service ${service.l2vpn.deleteService}

Rollback device configs
    rollback NSO "${nso}" to rollback retrieved

*** Keywords ***

