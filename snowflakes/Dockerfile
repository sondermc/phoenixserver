FROM quay.io/centos/centos:stream9
LABEL maintainer="Chris Sondermeijer <chris.sondermeijer@google.com>"

ENV USER=phoenix
ENV UID=1000
ENV GROUP=phoenix
ENV GID=1000
ENV HOME=/home/${USER}

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial \
  && dnf -y update \ 
  && dnf -y install sudo openssh-server \
  && dnf clean all

RUN useradd -ms /bin/bash ${USER}
USER ${USER}

COPY centos/sudoers_snowflakes /etc/sudoers.d/snowflakes
ADD --chmod=0755 centos/entrypoint.sh /usr/local/bin/entrypoint.sh
ADD --chown=${USER}:${GROUP} --chmod=0600 centos/phoenix_keypair-rsa.pub ${HOME}/.ssh/authorized_keys
