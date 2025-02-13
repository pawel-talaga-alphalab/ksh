# ksh
Simple SSH wrapper to support accessing our EKS nodes. Put it in your path

## How to use
Put it somewhere in your path, chmod +x and then just:
```
ksh hostname
```
or
```
ksh hostname "command"
```

Wrapper should let you log in and execute commands both on EKS nodes and on regular EC2 boxes.

### Example Usage
EKS:
```
ksh ip-10-1-27-197.ap-southeast-1.compute.internal
ksh ip-10-1-27-197.ap-southeast-1.compute.internal "df -h"
```
Regular:
```
ksh generic-cldn-tokyo-01
ksh generic-cldn-tokyo-01 "df -h"
```

## Requirements
* kubectl
* kubectx
