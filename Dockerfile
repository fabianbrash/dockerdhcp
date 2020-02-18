FROM local/c7-systemd:latest

LABEL maintainer="fabianbrash@gmail.com"

RUN yum upgrade -y && yum install -y dhcp-4.2.5 && yum install -y curl
RUN yum clean all

WORKDIR /etc/dhcp

RUN curl -LO https://containerblobs.blob.core.windows.net/containerdata/dhcpd.conf

RUN systemctl enable dhcpd.service

#RUN cp /usr/share/doc/dhcp-4.2.5/dhcpd.conf.example /etc/dhcp/dhcpd.conf

EXPOSE 67/udp
EXPOSE 68/udp

CMD ["/usr/sbin/init"]



