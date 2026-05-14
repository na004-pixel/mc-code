# Commands (run these on router)

-- Commands for Gateway configuration -- 

>en
#config t
#hostname dhcp-server
#int f0/0 
#ip add 192.168.1.1 255.255.255.0
#no sh
#int f0/1
#ip add 192.168.2.1 255.255.255.0
#no sh
# exit
#do sh ip int br

-- Commands for DHCP configuration --

#ip dhcp excluded-address 192.168.1.1
#ip dhcp excluded-address 192.168.2.1

#ip dhcp pool 192.168.1.1 
#network 192.168.1.0 255.255.255.0
#default-router 192.168.1.1
#dns-server 8.8.8.8

#ip dhcp pool 192.168.2.1 
#network 192.168.2.0 255.255.255.0
#default-router 192.168.2.1
#dns-server 8.8.8.8
