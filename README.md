# docker-vpnc-client
IPSec VPN client compatible with Cisco i.e. usable with FRITZ!Box, inside docker container

**NOTE:** currently not for production use, since no security considerations are made

General purpose openconnect client docker container, which allows SSH tunnels from your local host to a remote host.

## Build

    docker build -t vpnc-client .

## Run

    docker run -ti --rm --privileged -p 4122:22 --name vpn_mynet vpnc-client --gateway my.tun.net --id gr.vpn --username un.vpn

## Tunnel
now you can create an SSH tunnel to a remote host, or create SOCKS tunnel, to the destination network 

### RDP
example for RDP:

    ssh -o PreferredAuthentications=password -L 192.168.31.10:33890:10.11.12.1:3389 -N root@localhost -p 4122

|                 |                          |
| --------------- |:------------------------:|
| local host IP:  | 192.168.31.10 (optional) |
| local host port:| 33890                    |
| remote host:    | 10.11.12.1               |
| remote port:    | 3389                     |


after that enter password 'root'

### SOCKS
example for SOCKS:

    ssh -o PreferredAuthentications=password -D 58080 -C -N root@localhost -p 4122

-D: Tells SSH that we want a SOCKS tunnel on the specified port number
-C: Compresses the data before sending it
-N: Tells SSH that no command will be sent once the tunnel is up

the last port is the login to docker container over SSH using root user on port 4122
after that you need to enter the 'root' password
