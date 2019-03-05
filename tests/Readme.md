## Local RASTA Tests

### Run your tests
To run local RASTA tests, move to the root of the project.
Execute `./test/rasta/local-rasta.sh [HOST:IP]` and follow the instructions on screen.
> Use the optional argument [HOST:IP] to provide connectivity to NSO. It leverages the optional argument --add-host when running the container that populates /etc/hosts inside the container.

**Example**
If your testbed uses the hostname `nso` to reach NSO and it is at 192.168.1.20, you can run the container using :
```
./test/rasta/local-rasta.sh nso:192.168.1.20
```
(warning: Do not use 127.0.0.1 for the NSO IP, this is the local IP inside the containter. Check your NSO IP address with "ifconfig")

You are now inside the container, it should have the NSO project mounted at `/project`. This is the default working directory of the container.
Find a .robot file and perform `robot [YOUR_TESTS].robot`.