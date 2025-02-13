# ksh
Simple SSH wrapper to support accessing our EKS nodes. Put it in your path

## Usage
Put it somewhere in your path, chmod +x and then just:
```
ksh hostname
```
or
```
ksh hostname "command"
```

Wrapper should let you log in and execute commands both on EKS nodes and on regular EC2 boxes.

## Requirements
* kubectl
* kubectx
