FROM ubuntu:14.04.4

RUN apt-get update; apt-get -y install pptpd iptables

COPY pptpd.conf /etc/

RUN echo 'ms-dns 8.8.8.8' >> /etc/ppp/pptpd-options

EXPOSE 1723

ENTRYPOINT pptpd --fg
