# bind9-arm

Based on the official docker file by ICS for x86

https://github.com/isc-projects/bind9-docker/blob/v9.16/Dockerfile

# Bind Mount Volume Permissions

To simplify permissions when using bind mount volumes, the bind user is pre-created in the container with UID & GID of 800.
Create a local user with the same UID/GID in the host OS for easy mapping of permissions

```
groupadd -r -g $GUID bind
useradd -d /var/cache/bind -M -r -s /usr/sbin/nologin -u 800 -g 800 bind
```
