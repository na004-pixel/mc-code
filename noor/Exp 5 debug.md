# Auxiliary Guide — Verification & Troubleshooting

## 1. Verify Interface Status

On the router CLI:

### Check interfaces

* Verify:

  * `FastEthernet0/0` is **up**
  * Interface has correct IP address

### Things to look for

| Status                | Meaning               |
| --------------------- | --------------------- |
| up/up                 | Working correctly     |
| administratively down | `no shutdown` missing |
| down/down             | Cable or device issue |

---

# 2. Verify DHCP Service

## Check DHCP Pool

Verify:

* Pool exists
* Correct network configured
* Addresses available

---

## Check DHCP Bindings

Verify:

* PCs received IP addresses
* Assigned addresses match expected subnet

Example expectation:

```text id="w3w6p1"
192.168.1.x
```

---

# 3. Verify PC Addressing

On each PC:

## Open:

* Desktop → IP Configuration

Check:

| Field           | Expected      |
| --------------- | ------------- |
| IP Address      | 192.168.1.x   |
| Subnet Mask     | 255.255.255.0 |
| Default Gateway | 192.168.1.1   |
| DNS             | 8.8.8.8       |

---

# 4. Connectivity Testing

## From PC Command Prompt

Open:

* Desktop → Command Prompt

---

## Ping Router

Test:

```text id="j8yuhh"
ping 192.168.1.1
```

Expected:

```text id="31aj2z"
Reply from 192.168.1.1
```

---

## Ping Another PC

Example:

```text id="d5rrsd"
ping 192.168.1.11
```

If successful:

* Switch connectivity works
* DHCP addressing works

---

# 5. Physical Troubleshooting

## Check Link Lights

| Light    | Meaning          |
| -------- | ---------------- |
| Green    | Active           |
| Blinking | Traffic          |
| No light | Cable/port issue |

---

## Verify Correct Cable Type

Use:

* Copper Straight-Through

Do not use:

* Console cable
* Fiber
* Cross-over (for this setup)

---

# 6. Common Problems & Fixes

## PCs Do Not Receive IP

### Causes

* Interface shutdown
* Wrong interface configured
* Wrong network in DHCP pool
* Incorrect cable connection

### Fix

* Enable interface
* Recheck pool configuration
* Reconnect cables

---

## PCs Receive APIPA Address

Example:

```text id="1zix9l"
169.254.x.x
```

Meaning:

* DHCP failed

Fix:

* Verify router DHCP configuration
* Ensure router interface is up
* Renew DHCP on PC

---

## Ping Fails but IP Exists

### Causes

* Wrong gateway
* Wrong subnet mask
* Devices in different networks

### Fix

* Recheck interface IP
* Recheck DHCP pool network

---

# 7. Renew DHCP Lease

On PC:

## Method 1

* Desktop → IP Configuration
* Toggle:

  * Static → DHCP

---

## Method 2

Use Command Prompt:

```text id="1z8ng8"
ipconfig /renew
```

---

# 8. Simulation Mode (Optional)

## Open:

* Bottom-right → Simulation

Useful for:

* Watching DHCP Discover/Offer/Request/Ack packets
* Tracking failed communication

---

# 9. Save Working Configuration

After everything works:

## Router

Save running configuration to startup configuration.

## Packet Tracer

* File → Save

---

# Quick Troubleshooting Checklist

```text id="x3bp1m"
[ ] Correct cables used
[ ] Router interface configured
[ ] Interface enabled
[ ] DHCP pool created
[ ] PCs set to DHCP
[ ] PCs received IP addresses
[ ] Router responds to ping
[ ] PCs can ping each other
```
