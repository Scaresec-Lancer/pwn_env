# pwn_env
A fast pwn environment,build based on ubuntu via docker

## usage
```bash
docker build -t x2/pwn_env:1.0 .
```

## docker start
```bash
docker run -itd --name pwn01 x2/pwn_env:1.0 /bin/bash
docker exec -it pwn01 /bin/bash
```
