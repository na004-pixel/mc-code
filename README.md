# practical code dump

A clean index of the practical files in this repository.

## Quick links

- [Arnav folder](#arnav-folder)
- [Noor folder](#noor-folder)

## Arnav folder

| Practical | File | What it covers |
|---|---|---|
| Exp 1 | [Exp 1 CDMA.py](./arnav/Exp%201%20CDMA.py) | CDMA spreading, channel combination, and decoding |
| Exp 4 | [Exp 4 Rayleigh.matlab](./arnav/Exp%204%20Rayleigh.matlab) | BPSK BER simulation in Rayleigh fading |
| Exp 5 | [Exp 5 DHCP.md](./arnav/Exp%205%20DHCP.md) | Gateway and DHCP configuration commands |
| Exp 8 | [Expo 8 TCP Sockets.py](./arnav/Expo%208%20TCP%20Sockets.py) | TCP file transfer using server/client sockets |

## Noor folder

| Practical | File | What it covers |
|---|---|---|
| Exp 1 | [Exp 1 CDMA.py](./noor/Exp%201%20CDMA.py) | CDMA spreading, channel combination, and decoding |
| Exp 4 | [Exp 4 Rayleigh-BER.matlab](./noor/Exp%204%20Rayleigh-BER.matlab) | BER simulation for BPSK in Rayleigh fading |
| Exp 5 | [Exp 5 DHCP Commands.md](./noor/Exp%205%20DHCP%20Commands.md) | DHCP command reference |
| Exp 5 | [Exp 5 DHCP guide.md](./noor/Exp%205%20DHCP%20guide.md) | DHCP setup guide |
| Exp 8 | [Exp 8 TCP Sockets.py](./noor/Exp%208%20TCP%20Sockets.py) | TCP file transfer using server/client sockets |

## File list at a glance

- `arnav/Exp 1 CDMA.py`
- `arnav/Exp 4 Rayleigh.matlab`
- `arnav/Exp 5 DHCP.md`
- `arnav/Expo 8 TCP Sockets.py`
- `noor/Exp 1 CDMA.py`
- `noor/Exp 4 Rayleigh-BER.matlab`
- `noor/Exp 5 DHCP Commands.md`
- `noor/Exp 5 DHCP guide.md`
- `noor/Exp 8 TCP Sockets.py`

## Notes

- The Arnav and Noor folders contain overlapping practicals in different variants.
- Links are relative, so they will work directly inside the repository on GitHub.
"""
path = Path('/mnt/data/README.md')
path.write_text(readme, encoding='utf-8')
str(path)
