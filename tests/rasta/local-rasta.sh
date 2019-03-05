SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


#IMAGE="dockerhub.cisco.com/as-release-docker/cisco/rasta-centos6:1.2.0 /bin/bash -l"
IMAGE="dockerhub.cisco.com/as-release-docker/cisco/rasta:centos7 /bin/bash -l"

echo """
Check NSO connectivity with 'check-nso HOSTNAME [HTTP_PORT] [SSH_PORT]'.
The HOSTNAME value should match the one configured in the RASTA testbed and
the HTTP_PORT/SSH_PORT what is configured in ncs.conf.
Run tests using 'robot [YOUR_TESTS].robot'
"""
if [[ -z "$@" ]]; then
	docker run --rm -it -u cisco -v $SCRIPT_DIR/../..:/project $IMAGE
else
	for arg; do HOSTS+="--add-host=$arg "; done
	docker run --rm -it -u cisco -v $SCRIPT_DIR/../..:/project $HOSTS $IMAGE
fi

