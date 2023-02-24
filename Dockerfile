FROM ubuntu:18.04

RUN apt update -y && \
    apt install gcc -y

COPY entrypoint.sh /etc/entrypoint.sh
RUN chmod +x /etc/entrypoint.sh

WORKDIR /pwd

ENTRYPOINT ["/etc/entrypoint.sh"]