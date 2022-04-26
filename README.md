#capstone project
Automatic AppArmor management for Docker containers

## Usage
To use *this tool* simply use docker commands by replacing the "docker" with "capstone". For example to start a new container run the following command:

```bash
capstone run --name safe-nginx -p 80:80 nginx
```
To use the profile training feature of docker-sec user can do the following:
```bash
capstone train-stop safe-nginx
#browse nginx pages...
capstone train-stop safe-nginx
```

## Installation
To install capstone, first of all AppArmor must be installed and enabled.
Also, auditd must be installed in system. For Debian based systems run:

```bash
sudo apt-get install auditd audispd-plugins
```

As a next step, clone capstone from github and move contents of folder *profiles* to */etc/apparmor.d*. Once done, add *usr.bin.docker-runc* in kernel in enforce mode using the following command:

```bash
sudo aa-enforce /etc/apparmor.d/usr.bin.docker-runc
```
At the very end, change the DIR variable inside the scripts. 

Finally capstone script should be added to PATH environment variable.

Tool is ready to protect your containers!

Thanks to Fotis Loukidis for a provided skeleton for this project.

