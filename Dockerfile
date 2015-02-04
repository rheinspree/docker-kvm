# QEMU/KVM 
FROM ubuntu:trusty
MAINTAINER Ian Blenke <ian@blenke.com>

RUN apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install qemu-kvm libvirt-bin bridge-utils

ADD definitions/ /etcd/libvirt/qemu

ADD run.sh /run.sh
RUN chmod +x /run.sh

VOLUME /var/lib/libvirt

CMD /run.sh
