*** Settings ***
Library    OperatingSystem
Library    Collections

Resource   ./common/common-keywords.robot
Resource   rasta.robot

Variables   config.yaml
Variables   ./cases-files/04-l2vpn-pseudowire-portmode/case-config.yaml

*** Test Cases ***

create l2vpn using REST API in port mode
    use testbed "${testbed}"
    #via NSO REST API configure device "${nso}" at URI "${rest_base}" using "POST" with "json" payload "${service.l2vpn.createPayload.portModeTest}" and expect "" in response
    via NSO REST API configure device "${nso}" at URI "${rest_base}" using "POST" with "json" payload "${service.l2vpn.createPayload.portModeTest}"

delete l2vpn created in port mode
    Delete Service ${service.l2vpn.deleteService}

*** Keywords ***

