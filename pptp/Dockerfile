FROM ubuntu:14.04.4

RUN apt-get update; apt-get -y install pptpd iptables

COPY pptpd.conf /etc/

RUN echo 'ms-dns 8.8.8.8
          ms-dns 8.8.4.4' >> /etc/ppp/pptpd-options

RUN sysctl net.ipv4.ip_forward=1
RUN iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

ENTRYPOINT pptpd --fg


