# pwn_env
A fast pwn environment,build based on ubuntu via docker

| Version | Total size |
| ------- | ---------- |
| 1.0     | 1.12G      |



## Build yourself and start docker containers

**docker build images**

```bash
docker build -t 1527099663/pwn_env:1.0 .
```



## Or pull images from docker hub and quick start

**pull images**

```bash
docker pull 1527099663/pwn_env
```



## Start docker container

**container start**

```bash
docker run -itd --name pwn01 1527099663/pwn_env:1.0 /bin/bash
docker exec -it pwn01 /bin/bash
```



