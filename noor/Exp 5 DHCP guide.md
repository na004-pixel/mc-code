# Cisco 2811 as DHCP Server — Packet Tracer Setup Guide

## 1. Add Devices

From the bottom device panel in Packet Tracer:

### Add:

* 1 × Cisco 2811 Router
* 1 × 2960 Switch
* 2–3 PCs

Place them on the workspace.

---

# 2. Create Connections

## Router → Switch

### Cable:

* **Copper Straight-Through**

### Ports:

| Device | Port            |
| ------ | --------------- |
| Router | FastEthernet0/0 |
| Switch | FastEthernet0/1 |

---

## Switch → PCs

### Cable:

* **Copper Straight-Through**

### Example:

| PC  | Switch Port |
| --- | ----------- |
| PC0 | Fa0/2       |
| PC1 | Fa0/3       |
| PC2 | Fa0/4       |

---

# 3. Configure Router

## Open CLI

* Click Router
* Go to **CLI**
* Press Enter if prompted

---

## Enter Configuration Mode

Run the router configuration commands separately (see other file).

This configuration should:

* Assign IP to `FastEthernet0/0`
* Enable interface
* Create DHCP pool
* Set gateway and DNS

---

# 4. Wait for Interface Activation

After enabling interface:

* Wait a few seconds
* Link lights should turn green

---

# 5. Configure PCs for DHCP

For each PC:

## Open:

* PC → Desktop → IP Configuration

## Select:

* **DHCP**

Packet Tracer should automatically assign:

* IP Address
* Subnet Mask
* Default Gateway
* DNS

Repeat for all PCs.

---

# 6. Save Packet Tracer File

## Top Menu:

* File → Save As

Choose a filename and save the `.pkt` file.

---

# Final Topology

```text
        [ Cisco 2811 ]
              |
              |
         [ Switch ]
          /   |   \
        PC0  PC1  PC2
```
