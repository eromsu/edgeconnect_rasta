*** Settings ***
Library    OperatingSystem
Library    Collections

Resource   ./common/common-keywords.robot
Resource   rasta.robot

Variables   config.yaml
Variables   ./cases-files/05-l3-internet-nativo/case-config.yaml

*** Keywords ***

*** Test Cases ***

######## 1. Cisco - p2p-native static [ done ]

CREATE [L3 internet nativo] cisco p2p native static using REST API
    use testbed "${testbed}"
    retrieve latest NSO rollback number from "${nso}"    
    Save pre-service Cisco IOS device ${ios_device} configuration in ${testdir}
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "PATCH" with "json" payload "${service.l3.internet.nativo.cisco_ios.p2p_native.static.createPayload}" and expect "" in response
    Save post-service Cisco IOS device ${ios_device} configuration in ${testdir}

#VALIDATE [L3 internet nativo] cisco p2p native static
#    Compare config expect "${diff.expectedAdd.l3.internet.nativo.cisco_ios.p2p_native.static}" to be added and "" removed in ${testdir}

DELETE [L3 internet nativo] cisco p2p native static
    Delete Service ${service.l3.internet.nativo.cisco_ios.p2p_native.static.deleteService}

######## 2. Cisco - p2p-native bgp [ done ]

CREATE [L3 internet nativo] cisco p2p native bgp using REST API
    use testbed "${testbed}"
    retrieve latest NSO rollback number from "${nso}"    
    Save pre-service Cisco IOS device ${ios_device} configuration in ${testdir}
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "PATCH" with "json" payload "${service.l3.internet.nativo.cisco_ios.p2p_native.bgp.createPayload}" and expect "" in response
    Save post-service Cisco IOS device ${ios_device} configuration in ${testdir}

#VALIDATE [L3 internet nativo] cisco p2p native bgp
#    Compare config expect "${diff.expectedAdd.l3.internet.nativo.cisco_ios.p2p_native.bgp}" to be added and "" removed in ${testdir}

DELETE [L3 internet nativo] cisco p2p native bgp
    Delete Service ${service.l3.internet.nativo.cisco_ios.p2p_native.bgp.deleteService}

######## 3. Cisco - p2p-dot1q static [ done ]

CREATE [L3 internet nativo] cisco p2p dot1q static using REST API
    use testbed "${testbed}"
    retrieve latest NSO rollback number from "${nso}"    
    Save pre-service Cisco IOS device ${ios_device} configuration in ${testdir}
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "PATCH" with "json" payload "${service.l3.internet.nativo.cisco_ios.p2p_dot1q.static.createPayload}" and expect "" in response
    Save post-service Cisco IOS device ${ios_device} configuration in ${testdir}

#VALIDATE [L3 internet nativo] cisco p2p dot1q static
#    Compare config expect "${diff.expectedAdd.l3.internet.nativo.cisco_ios.p2p_native.static}" to be added and "" removed in ${testdir}

DELETE [L3 internet nativo] cisco p2p dot1q static
    Delete Service ${service.l3.internet.nativo.cisco_ios.p2p_dot1q.static.deleteService}

######## 4. Cisco - p2p-dot1q bgp [ done ]

CREATE [L3 internet nativo] cisco p2p dot1q bgp using REST API
    use testbed "${testbed}"
    retrieve latest NSO rollback number from "${nso}"    
    Save pre-service Cisco IOS device ${ios_device} configuration in ${testdir}
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "PATCH" with "json" payload "${service.l3.internet.nativo.cisco_ios.p2p_dot1q.bgp.createPayload}" and expect "" in response
    Save post-service Cisco IOS device ${ios_device} configuration in ${testdir}

#VALIDATE [L3 internet nativo] cisco p2p dot1q bgp
#    Compare config expect "${diff.expectedAdd.l3.internet.nativo.cisco_ios.p2p_native.bgp}" to be added and "" removed in ${testdir}

DELETE [L3 internet nativo] cisco p2p dot1q bgp
    Delete Service ${service.l3.internet.nativo.cisco_ios.p2p_dot1q.bgp.deleteService}

######## 5. Cisco - p2p-qinq static [ done ]

CREATE [L3 internet nativo] cisco p2p qinq static using REST API
    use testbed "${testbed}"
    retrieve latest NSO rollback number from "${nso}"    
    Save pre-service Cisco IOS device ${ios_device} configuration in ${testdir}
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "PATCH" with "json" payload "${service.l3.internet.nativo.cisco_ios.p2p_qinq.static.createPayload}" and expect "" in response
    Save post-service Cisco IOS device ${ios_device} configuration in ${testdir}

#VALIDATE [L3 internet nativo] cisco p2p qinq static
#    Compare config expect "${diff.expectedAdd.l3.internet.nativo.cisco_ios.p2p_native.static}" to be added and "" removed in ${testdir}

DELETE [L3 internet nativo] cisco p2p qinq static
    Delete Service ${service.l3.internet.nativo.cisco_ios.p2p_qinq.static.deleteService}

######## 6. Cisco - p2p-qinq bgp [ done ]

CREATE [L3 internet nativo] cisco p2p qinq bgp using REST API
    use testbed "${testbed}"
    retrieve latest NSO rollback number from "${nso}"    
    Save pre-service Cisco IOS device ${ios_device} configuration in ${testdir}
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "PATCH" with "json" payload "${service.l3.internet.nativo.cisco_ios.p2p_qinq.bgp.createPayload}" and expect "" in response
    Save post-service Cisco IOS device ${ios_device} configuration in ${testdir}

#VALIDATE [L3 internet nativo] cisco p2p qinq bgp
#    Compare config expect "${diff.expectedAdd.l3.internet.nativo.cisco_ios.p2p_native.bgp}" to be added and "" removed in ${testdir}

DELETE [L3 internet nativo] cisco p2p qinq bgp
    Delete Service ${service.l3.internet.nativo.cisco_ios.p2p_qinq.bgp.deleteService}

######## 7. Juniper - p2p-native static

CREATE [L3 internet nativo] juniper p2p native static using REST API
    use testbed "${testbed}"
    retrieve latest NSO rollback number from "${nso}"    
    # Save pre-service Cisco IOS device ${ios_device} configuration in ${testdir}
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "PATCH" with "json" payload "${service.l3.internet.nativo.juniper_junos.p2p_native.static.createPayload}" and expect "" in response
    # Save post-service Cisco IOS device ${ios_device} configuration in ${testdir}

#VALIDATE [L3 internet nativo] juniper p2p native static
#    Compare config expect "${diff.expectedAdd.l3.internet.nativo.juniper_junos.p2p_native.static}" to be added and "" removed in ${testdir}

DELETE [L3 internet nativo] juniper p2p native static
    Delete Service ${service.l3.internet.nativo.juniper_junos.p2p_native.static.deleteService}

######## 8. Juniper - p2p-native bgp

CREATE [L3 internet nativo] juniper p2p native bgp using REST API
    use testbed "${testbed}"
    retrieve latest NSO rollback number from "${nso}"    
    # Save pre-service Cisco IOS device ${ios_device} configuration in ${testdir}
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "PATCH" with "json" payload "${service.l3.internet.nativo.juniper_junos.p2p_native.bgp.createPayload}" and expect "" in response
    # Save post-service Cisco IOS device ${ios_device} configuration in ${testdir}

#VALIDATE [L3 internet nativo] juniper p2p native bgp
#    Compare config expect "${diff.expectedAdd.l3.internet.nativo.juniper_junos.p2p_native.bgp}" to be added and "" removed in ${testdir}

DELETE [L3 internet nativo] juniper p2p native bgp
    Delete Service ${service.l3.internet.nativo.juniper_junos.p2p_native.bgp.deleteService}

######## 9. Juniper - p2p-dot1q static

CREATE [L3 internet nativo] juniper p2p dot1q static using REST API
    use testbed "${testbed}"
    retrieve latest NSO rollback number from "${nso}"    
    # Save pre-service Cisco IOS device ${ios_device} configuration in ${testdir}
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "PATCH" with "json" payload "${service.l3.internet.nativo.juniper_junos.p2p_dot1q.static.createPayload}" and expect "" in response
    # Save post-service Cisco IOS device ${ios_device} configuration in ${testdir}

#VALIDATE [L3 internet nativo] juniper p2p dot1q static
#    Compare config expect "${diff.expectedAdd.l3.internet.nativo.juniper_junos.p2p_native.static}" to be added and "" removed in ${testdir}

DELETE [L3 internet nativo] juniper p2p dot1q static
    Delete Service ${service.l3.internet.nativo.juniper_junos.p2p_dot1q.static.deleteService}

######## 10. Juniper - p2p-dot1q bgp

CREATE [L3 internet nativo] juniper p2p dot1q bgp using REST API
    use testbed "${testbed}"
    retrieve latest NSO rollback number from "${nso}"    
    # Save pre-service Cisco IOS device ${ios_device} configuration in ${testdir}
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "PATCH" with "json" payload "${service.l3.internet.nativo.juniper_junos.p2p_dot1q.bgp.createPayload}" and expect "" in response
    # Save post-service Cisco IOS device ${ios_device} configuration in ${testdir}

#VALIDATE [L3 internet nativo] juniper p2p dot1q bgp
#    Compare config expect "${diff.expectedAdd.l3.internet.nativo.juniper_junos.p2p_native.bgp}" to be added and "" removed in ${testdir}

DELETE [L3 internet nativo] juniper p2p dot1q bgp
    Delete Service ${service.l3.internet.nativo.juniper_junos.p2p_dot1q.bgp.deleteService}

######## 11. Juniper - p2p-qinq static

CREATE [L3 internet nativo] juniper p2p qinq static using REST API
    use testbed "${testbed}"
    retrieve latest NSO rollback number from "${nso}"    
    # Save pre-service Cisco IOS device ${ios_device} configuration in ${testdir}
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "PATCH" with "json" payload "${service.l3.internet.nativo.juniper_junos.p2p_qinq.static.createPayload}" and expect "" in response
    # Save post-service Cisco IOS device ${ios_device} configuration in ${testdir}

#VALIDATE [L3 internet nativo] juniper p2p qinq static
#    Compare config expect "${diff.expectedAdd.l3.internet.nativo.juniper_junos.p2p_native.static}" to be added and "" removed in ${testdir}

DELETE [L3 internet nativo] juniper p2p qinq static
    Delete Service ${service.l3.internet.nativo.juniper_junos.p2p_qinq.static.deleteService}

######## 12. Juniper - p2p-qinq bgp

CREATE [L3 internet nativo] juniper p2p qinq bgp using REST API
    use testbed "${testbed}"
    retrieve latest NSO rollback number from "${nso}"    
    # Save pre-service Cisco IOS device ${ios_device} configuration in ${testdir}
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "PATCH" with "json" payload "${service.l3.internet.nativo.juniper_junos.p2p_qinq.bgp.createPayload}" and expect "" in response
    # Save post-service Cisco IOS device ${ios_device} configuration in ${testdir}

#VALIDATE [L3 internet nativo] juniper p2p qinq bgp
#    Compare config expect "${diff.expectedAdd.l3.internet.nativo.juniper_junos.p2p_native.bgp}" to be added and "" removed in ${testdir}

DELETE [L3 internet nativo] juniper p2p qinq bgp
    Delete Service ${service.l3.internet.nativo.juniper_junos.p2p_qinq.bgp.deleteService}

######## 13. MIX Cisco P2P-Native vs P2P-[dot1q | qinq] into the same interface

CREATE [L3 internet nativo] MIX Cisco P2P-Native vs P2P-[dot1q | qinq] into the same interface
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "PATCH" with "json" payload "${service.l3.internet.nativo.errors.mix_p2p.p2p_native}" and expect "" in response
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "PATCH" with "json" payload "${service.l3.internet.nativo.errors.mix_p2p.p2p_dot1q}" and expect "${negative.mix_p2p}" in response

DELETE [L3 internet nativo] MIX Cisco P2P-Native vs P2P-[dot1q | qinq] into the same interface
    Delete Service ${service.l3.internet.nativo.errors.mix_p2p.deleteServiceA}
    # Delete Service ${service.l3.internet.nativo.errors.mix_p2p.deleteServiceB}

######## 14. Deploy Cisco P2P-[dot1q | qinq] on already configured BGP: same ASN

CREATE [L3 internet nativo] Deploy Cisco P2P-[dot1q | qinq] on already configured BGP: same ASN
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "PATCH" with "json" payload "${service.l3.internet.nativo.errors.bgp_already_deployed_same_asn.bgp}" and expect "" in response
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "PATCH" with "json" payload "${service.l3.internet.nativo.errors.bgp_already_deployed_same_asn.new_bgp}" and expect "" in response

DELETE [L3 internet nativo] Deploy Cisco P2P-[dot1q | qinq] on already configured BGP: same ASN
    Delete Service ${service.l3.internet.nativo.errors.bgp_already_deployed_same_asn.deleteServiceA}
    Delete Service ${service.l3.internet.nativo.errors.bgp_already_deployed_same_asn.deleteServiceB}

######## 15. Deploy Cisco P2P-[dot1q | qinq] on already configured BGP: different ASN

CREATE [L3 internet nativo] Deploy Cisco P2P-[dot1q | qinq] on already configured BGP: different ASN
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "PATCH" with "json" payload "${service.l3.internet.nativo.errors.bgp_already_deployed_different_asn.bgp}" and expect "" in response
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "PATCH" with "json" payload "${service.l3.internet.nativo.errors.bgp_already_deployed_different_asn.new_bgp}" and expect "${negative.bgp_already_deployed_different_asn}" in response

DELETE [L3 internet nativo] Deploy Cisco P2P-[dot1q | qinq] on already configured BGP: different ASN
    Delete Service ${service.l3.internet.nativo.errors.bgp_already_deployed_different_asn.deleteServiceC}
    # Delete Service ${service.l3.internet.nativo.errors.bgp_already_deployed_different_asn.deleteServiceD}