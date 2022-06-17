# pwn_env
A fast pwn environment,build based on ubuntu via docker

| Version | Total size |
| ------- | ---------- |
| 2.0     | 930MB      |



## Build yourself and start docker containers

**docker build images**

```bash
docker build -t "pwn" .
```



## Or pull images from docker hub and quick start

**pull images**

```bash
docker pull 1527099663/pwn_env:2.0
```



## Start docker container

**container start**

```bash
docker run -itd -p 3000 --name pwn01 1527099663/pwn_env:2.0 /bin/bash
docker exec -it pwn01 /bin/bash
```



