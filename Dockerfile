FROM centos:8

# metadata
LABEL maintainer="Manish K Khedawat"
LABEL email=writetomansa@gmail.com
LABEL description="Cent OS based docker image with preinstalled SSH server and NodeJS utilities"

# configs
ENV NVM_VERSION 0.35.0
ENV NODE_VERSION 12.12.0
ENV PM2_VERSION 4.0.0

ENV USER root
ENV NVM_DIR /$USER/.nvm
ENV NODE_MODUELS_DIR $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# install yum packages
RUN yum -y update
RUN yum -y install wget openssh-server

# install node-utilities
RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v$NVM_VERSION/install.sh  | bash
RUN source $NVM_DIR/nvm.sh && nvm install $NODE_VERSION
RUN npm install -g pm2@$PM2_VERSION

# setup ssh server
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN ssh-keygen -A

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
