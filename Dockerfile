FROM ubuntu

# ubuntu换源
RUN echo 'deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse' > /etc/apt/sources.list
RUN echo 'deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse' >> /etc/apt/sources.list
RUN echo 'deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse' >> /etc/apt/sources.list
RUN echo 'deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse' >> /etc/apt/sources.list
RUN echo 'deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse' >> /etc/apt/sources.list
RUN echo 'deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse' >> /etc/apt/sources.list
RUN echo 'deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse' >> /etc/apt/sources.list
RUN echo 'deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse' >> /etc/apt/sources.list
RUN echo 'deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse' >> /etc/apt/sources.list
RUN echo 'deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse' >> /etc/apt/sources.list

RUN apt update

# 设置时区为上海，防止apt install 时需要选择时区
ARG DEBIAN_FRONTEND=noninteractive

RUN apt install gdb vim -y
RUN apt install python3 python3-pip -y
RUN apt install net-tools build-essential -y
RUN apt install module-assistant gcc-multilib g++-multilib -y

# pip换源
RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

# 安装pwntools
RUN pip install pwntools

# 添加pwndbg
ADD pwndbg.tar.gz /usr/local
RUN cd /usr/local/pwndbg && chmod +x ./setup.sh && ./setup.sh

# 添加ida_pro远程调试模块
RUN cd /usr/local && mkdir ida
ADD linux_server /usr/local/ida
ADD linux_server64 /usr/local/ida


# 设置默认语言为en_US.UTF-8，避免GDB报编码错误
#RUN apt install locales -y && locale-gen en_US.UTF-8 
#RUN echo 'LANG="en_US.UTF-8"' > /etc/default/locale
#RUN echo 'LANGUAGE="en_US.UTF-8:"' >> /etc/default/locale
#RUN export LANG="en_US.UTF-8" >> /etc/bash.bashrc
#RUN export LANGUAGE="en_US.UTF-8:" >> /etc/bash.bashrc
