FROM ubuntu:20.04

RUN apt-get update && \
    apt install -y wget build-essential unzip && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -d /home/ctf/ -m -p ctf -s /bin/bash ctf && \ 
    echo "ctf:ctf" | chpasswd

WORKDIR /home/ctf

COPY ["chall.c", "start.sh", "chall.sh", "./"]

RUN gcc chall.c -o chall -fno-stack-protector -z execstack -no-pie

RUN wget https://github.com/joewalnes/websocketd/releases/download/v0.3.0/websocketd-0.3.0-linux_amd64.zip && \
    unzip websocketd-0.3.0-linux_amd64.zip && \
    chmod +x websocketd && \
    apt remove -y wget build-essential unzip && \
    apt autoremove -y

USER ctf

CMD ./start.sh
