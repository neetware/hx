# The "Hacks" package manager
Install and run scripts the easy way!

# Hack package manager feature checklist

- [x] Ability to download the package
- [x] Ability to delete the package
- [x] Ability to update the package
- [ ] Ability to run the package
- [ ] Properly set the .hx folder in the user's home directory

## Requirements:

- [Swift 5.0](https://swift.org/download/)
- [git](https://www.git-scm.com/)

## Installation:

### Build it and add it to your $PATH 

```bash
swiftc main.swift -o hx
sudo mv hx /usr/local/bin
```
## Usage:

Help command:

```bash
hx i help
```

Install hacks:

```bash
hx i <hackname>
```

Run hacks:

```bash
hx r <hackname>
```

Delete hacks:

```bash
hx d <hackname>
```

Update hacks:

```bash
hx u <hackname>
```