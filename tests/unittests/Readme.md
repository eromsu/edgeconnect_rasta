# TEST CASES FOR RASTA FRAMEWORK

## directories:

### test-generation:
Root level contains generated test cases, config.yaml and testbed.yaml

### test-generation/cases-files:
Contains a directory per each test case. 
Each file Contains the input json file and the reference result according to which the test will be evaluated.

### test-generation/robot-templates:
Template files with placeholders for case identifiers. Currently supports \<\<CASENAME\>\> and \<\<INSTANCENAME\>\> replacement.
Template files should NOT have file extensions supported by robot, otherwise, robot will try to run then, which will lead to false test failures. Use dummy extension instead (e.g. .template)

### test-generation/test-cases:
Each file serves a robot template. each line is a test case, and each column is a value to be replaced by case identifiers (e.g casename, instancename).

## scripts:

## test-generation/generate-tests.py:
Takes, test-case file, robot-template file and target tests directory as input. 
Iterates the test cases and creates a copy of the robot template, replacing the case placeholders with the identifiers in the current line in the file.
