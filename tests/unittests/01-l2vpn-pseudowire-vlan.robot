*** Settings ***
Library    OperatingSystem
Library    Collections

Resource   ./common/common-keywords.robot
Resource   rasta.robot

Variables   config.yaml
Variables   ./cases-files/01-l2vpn-pseudowire-vlan/case-config.yaml

*** Test Cases ***

create l2vpn using REST API with the same single vlan
    use testbed "${testbed}"
    retrieve latest NSO rollback number from "${nso}"
    Save pre-service Cisco IOS device ${ios_device} configuration in ${testdir}
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "POST" with "json" payload "${service.l2vpn.createPayload.sameSingleVlan}" and expect "" in response
    Save post-service Cisco IOS device ${ios_device} configuration in ${testdir}

validate created configuration for l2vpn creation for same single vlan
    Compare config expect "${diff.expectedAdd.ios.no_vlan_rewrite}" to be added and "" removed in ${testdir}

delete l2vpn created with same single vlan
    Delete Service ${service.l2vpn.deleteService}

create l2vpn using REST API with the vlan rewrite
    Save pre-service Cisco IOS device ${ios_device} configuration in ${testdir}
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "POST" with "json" payload "${service.l2vpn.createPayload.vlanReWrite}" and expect "" in response
    Save post-service Cisco IOS device ${ios_device} configuration in ${testdir}

validate created configuration for l2vpn creation for vlan rewrite
    Compare config expect "${diff.expectedAdd.ios.with_vlan_rewrite}" to be added and "" removed in ${testdir}

delete l2vpn created with vlan rewrite
    Delete Service ${service.l2vpn.deleteService}

create l2vpn using REST API with multiple vlans
    Save pre-service Cisco IOS device ${ios_device} configuration in ${testdir}
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "POST" with "json" payload "${service.l2vpn.createPayload.multipleVlans}" and expect "" in response
    Save post-service Cisco IOS device ${ios_device} configuration in ${testdir}

validate created configuration for l2vpn creation for multiple vlans
    Compare config expect "${diff.expectedAdd.ios.multiple_vlans}" to be added and "" removed in ${testdir}

delete l2vpn created with multiple vlans
    Delete Service ${service.l2vpn.deleteService}

(Negative) create l2vpn using REST API with differente multiple vlans
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "POST" with "json" payload "${service.l2vpn.createPayload.DifferentMultipleVlans}" and expect "${negative.multipleVlansExpectedOutput}" in response

(Negative) create l2vpn using REST API providing invalid IP address
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "POST" with "json" payload "${service.l2vpn.createPayload.invalidIP}" and expect "${negative.invalidIPExpectedOutput}" in response

(Negative) create l2vpn using REST API providing invalid device
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "POST" with "json" payload "${service.l2vpn.createPayload.invalidDevice}" and expect "${negative.invalidDeviceExpectedOutput}" in response

Rollback device configs
    rollback NSO "${nso}" to rollback retrieved

*** Keywords ***

