FROM alpine:3.14

LABEL maintainer="didlich@gmail.com"

RUN apk update && apk add --no-cache \
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


