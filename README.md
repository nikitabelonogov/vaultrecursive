# Vault recursive
This utility will walk thru the vault tree and apply the command to all keys.

## Installation
* Clone the repo
* Create a symlink in one of your PATHs
```sh
ln -s -f $(pwd)/vaultrecursive/vaultrecursive.sh /usr/local/bin/vaultrecursive
```

## Usage
```sh
vaultrecursive read /secret/
```
