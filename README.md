# crpd-evpn-vxlan

## Demo Topology

```mermaid                                                                          
graph TB
p1["p1 81.4.4.4"]---pe1["pe1 81.1.1.1"]
p1---pe2["pe2 81.2.2.2"]
p1---pe3["pe3 81.3.3.3"]
pe1---ce1["ce1 99.60.0.1"]
pe1---ce2["ce2 99.60.0.2"]
pe2---ce3["ce3 99.60.0.3"]
pe2---ce4["ce4 99.60.1.1"]
pe3---ce5["ce5 99.60.1.2"]
pe3---ce6["ce6 99.60.1.3"]
```

## Deploy

You need to add crpd license keys to all instances to get the BGP sessions up.

Then build and deploy the topology via make:

```
$ make
```

See [example-run.txt](example-run.txt) for an example run, including running validate.sh.

To show the running containers, use

```
$ docker-compose ps

Name               Command               State    Ports
-------------------------------------------------------
ce1     /bin/bash /config/network- ...   Up            
ce2     /bin/bash /config/network- ...   Up            
ce3     /bin/bash /config/network- ...   Up            
ce4     /bin/bash /config/network- ...   Up            
ce5     /bin/bash /config/network- ...   Up            
ce6     /bin/bash /config/network- ...   Up            
links   /usr/bin/python3 /add_link ...   Exit 0        
p1      /sbin/runit-init.sh              Up            
pe1     /sbin/runit-init.sh              Up            
pe2     /sbin/runit-init.sh              Up            
pe3     /sbin/runit-init.sh              Up            
```

To bring all containers down, use 

```
$ make down
```
