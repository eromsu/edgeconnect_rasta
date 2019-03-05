import os
import sys

# $1 test cases file
# $2 robot template
# $3 tests directory

# pwd: Telekom-Serbia-TS-NSO/tests/unittests
# run: python test-generation/generate-tests.py test-generation/test-cases/foofoo.txt test-generation/robot-templates/foofoo-template.robot

# open cases file and iterate the lines - DONE
# skip lines starting with '#' - DONE
# split each line - comma as delimiter - DONE
# copy template file and save it under the name of the first cell
# replace  <<CASENAME>> with content of first cell.
# replace  <<INSTANCENAME>> with content of second cell.

cases_file = sys.argv[1]
print("cases_file: {}".format(cases_file))
robot_template_file = sys.argv[2]
print("robot_template_file: {}".format(robot_template_file))
target_dir = sys.argv[3]
print("target_dir: {}".format(target_dir))

print("cases:")
fh = open(cases_file, 'r')
cases = fh.readlines()
fh.close()

fh = open(robot_template_file, 'r')
robot_template = fh.readlines()
fh.close()

for line in cases:
    if line.startswith("#"):
        continue
    case, instance = [x.strip() for x in line.split(',')]
    print('case/instance = {}/{}'.format(case, instance))
    target_file = "{}/{}.robot".format(sys.argv[3], case)
    print("target_file: {}".format(target_file))
    
    with open(target_file, "w") as robot:
        for line in robot_template:
            # replace case name and instance name markers in robot template with the relevant values to this test case.
            robot.write(line.replace('<<CASENAME>>', case).replace('<<INSTANCENAME>>', instance))
