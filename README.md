# The script package manager
Install and run scripts the easy way!

# Script package manager feature checklist

- [x] Ability to download the package
- [x] Ability to delete the package
- [x] Ability to update the package
- [ ] Ability to run the package

## Requirements:

- [Swift 5.0](https://swift.org/download/)
- [git](https://www.git-scm.com/)

## Installation:

### Build it and add it to your $PATH 

```bash
swiftc main.swift -o hx
sudo mv spm /usr/local/bin
```
## Usage:

Help command:

```bash
spm i help
```

Install hacks:

```bash
spm i <scriptname>
```

Run hacks:

```bash
spm r <scriptname>
```

Delete hacks:

```bash
spm d <scriptname>
```

Update hacks:

```bash
spm u <scriptname>
```