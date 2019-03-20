*** Settings ***
Library    OperatingSystem
Library    Collections
Library    RASTA

Resource   rasta.robot
Variables   config.yaml
#Variables   ./common/case-config.yaml

#Suite Setup    Load Topology and connect to devices


*** Test Cases ***

Load baseline configs
  Load Topology and connect to devices
#  Load baseline configs

*** Keywords ***

Load Topology and connect to devices
  [Tags]  setup
  use testbed "${testbed}"
  connect to device "${nso}"
  Set NSO cli style to "${cli_style}"
  execute command "devices sync-from" on device "${nso}"

#Load baseline configs
#  retrieve latest NSO rollback number from "${nso}"
#  via NSO RESTCONF API configure device "${nso}" at URI "${restconf_base}" using "PATCH" with "xml" payload "${pre_configs.devices}"
