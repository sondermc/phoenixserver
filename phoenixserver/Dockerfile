FROM alpine
LABEL maintainer="Chris Sondermeijer <chris.sondermeijer@google.com>"
ENV USER=phoenix
ENV UID=1000
ENV GROUP=phoenix
ENV GID=1000
ENV HOME=/home/${USER}

RUN apk -v --no-cache add \
  ansible \
  curl \
  openssh \
  sudo \
  tree

RUN addgroup -g ${GID} ${GROUP} && \
  adduser  --uid ${UID} --ingroup ${GROUP} --disabled-password ${USER} && \
  install -o ${USER} -g ${GROUP} -d ${HOME} 

COPY alpine/sudoers_${GROUP} /etc/sudoers.d/${GROUP}
ADD --chown=${USER}:${GROUP} --chmod=0400 alpine/phoenix_keypair-rsa ${HOME}/.ssh/id_rsa
ADD --chown=${USER}:${GROUP} --chmod=0644 alpine/phoenix_keypair-rsa.pub ${HOME}/.ssh/id_rsa.pub
ADD --chown=${USER}:${GROUP} --chmod=0600 alpine/ssh_config ${HOME}/.ssh/config

USER ${UID}
COPY alpine/.ash_history ${HOME}/.ash_history
 