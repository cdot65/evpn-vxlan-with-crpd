# crpd-evpn-vxlan

## Demo Topology

```mermaid                                                                          
graph TB
p1["p1 81.4.4.4"]---|mpls|pe1["pe1 81.1.1.1"]
p1---|mpls|pe2["pe2 81.2.2.2"]
p1---|mpls|pe3["pe3 81.3.3.3"]
pe1---|vxlan|ce1["ce1 99.60.0.1"]
pe1---|vxlan|ce2["ce2 99.60.0.2"]
pe2---|vxlan|ce3["ce3 99.60.0.3"]
pe2---|vxlan|ce4["ce4 99.60.1.1"]
pe3---|vxlan|ce5["ce5 99.60.1.2"]
pe3---|vxlan|ce6["ce6 99.60.1.3"]
```

