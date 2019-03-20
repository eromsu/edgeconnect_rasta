*** Settings ***
Library  OperatingSystem
Library  Collections
Library  RASTA

Resource  rasta.robot
Variables  config.yaml


#Suite Setup  Load Topology and connect to devices


#*** Variables ***

#${nso}  ncs
#${testbed}  testbed.yaml
#${cli_style}  cisco

*** Test Cases ***

Load initial configs
    Load Topology and connect to devices


*** Keywords ***

Load Topology and connect to devices
    [Tags]  setup
    use testbed "${testbed}"
    connect to device "${nso}"
    Set NSO cli style to "${cli_style}"
    Run NSO command "show ncs-state version" with expected result "ncs-state version 4.7.1"
