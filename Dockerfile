FROM alpine:edge

LABEL maintainer="didlich@t-online.de"

RUN apk update && apk add --no-cache \
  --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
  openssh \
  vpnc \
  curl

RUN mkdir /var/run/sshd

RUN echo "root:root" | chpasswd
RUN sed -i 's/#PermitRootLogin.*/PermitRootLogin\ yes/' /etc/ssh/sshd_config
RUN sed -i 's/^AllowTcpForwarding no/AllowTcpForwarding yes/' /etc/ssh/sshd_config

COPY  entrypoint.sh /
EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]


