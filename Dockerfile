FROM fedora:rawhide
MAINTAINER jkadlcik@redhat.com

ENV container docker
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN dnf -y update
RUN dnf -y install 'dnf-command(copr)'

# Install DNF with modularity support
RUN dnf -y copr enable mhatina/DNF-Modules
RUN dnf -y upgrade dnf >= 2.5.0

# In the default installation some lines are missing
# See the file for details
COPY etc/dnf/dnf.conf /etc/dnf/dnf.conf

# @TODO this repo is kinda unofficial, find a better one
# Taken from https://github.com/mhatina/dnf/blob/modules_install/tests/modules/etc/dnf/repos.d/boltron.repo
COPY etc/yum.repos.d/boltron.repo /etc/yum.repos.d/boltron.repo


CMD ["/usr/sbin/init"]
