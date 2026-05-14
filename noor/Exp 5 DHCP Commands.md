# DHCP Commands (run these in router)

```
enable
configure terminal

! Configure router interface
interface fastEthernet 0/0
 ip address 192.168.1.1 255.255.255.0
 no shutdown
exit

! Exclude reserved IP addresses
ip dhcp excluded-address 192.168.1.1 192.168.1.10

! Create DHCP pool
ip dhcp pool LAN_POOL
 network 192.168.1.0 255.255.255.0
 default-router 192.168.1.1
 dns-server 8.8.8.8
exit

! Save configuration
end
write memory
```
