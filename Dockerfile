FROM ubuntu

# 解决apt安装时的时区问题
ENV TIME_ZONE Asia/Shanghai 

# 解决pwndbg使用时，默认容器内POSIX编码出错问题
ENV LANG C.UTF-8

# 换源，设置时区，安装gdb vim python3 python3-pip net-tools curl gcc g++
RUN sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g; s/security.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list  \
    && apt update \
    && apt install -y tzdata \
    && ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo $TIME_ZONE > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
    && apt install gdb vim git python3 python3-pip net-tools curl -y \
    && pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip install pwntools LibcSearcher 
     

# 添加pwndbg，清理apt缓存
ADD pwndbg.tar.gz /usr/local
RUN cd /usr/local/pwndbg && chmod +x ./setup.sh && ./setup.sh \
    && apt clean \
    && rm -rf /tmp/* /var/cache/* /usr/share/doc/* /usr/share/man/* /var/lib/apt/lists/*

EXPOSE 3000



 

 
