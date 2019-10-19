# node-sshd

Cent OS based docker image with preinstalled SSH server and NodeJS utilities

## deafult-config

- username: root
- password: root

## how to use
```
- `$ ssh root@instanceIP` (default password is root)
- `$ echo "root:your-new-password" | chpasswd` (change default password)
- `$ yum install whatEverYouWant`
- `$ git clone whatEverCode`
- destroy instance once job is done
```

> note - this image is only meant for development playground
