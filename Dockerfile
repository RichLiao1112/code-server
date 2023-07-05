FROM linuxserver/code-server:latest

SHELL ["/bin/bash", "-c"]

RUN sudo apt-get update \
  && sudo apt-get install -y \
  vim 

COPY ./install_nvm.sh /home/coder/install_nvm.sh

RUN . /home/coder/install_nvm.sh

ENV NODE_VERSION 18.16.1

RUN source ~/.nvm/nvm.sh \
  && nvm install $NODE_VERSION \
  $$ nvm alias default $NODE_VERSION \
  && nvm use default