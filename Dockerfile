# Verificar a imagem do ambiente do os 
FROM ubuntu


# Difine o directorio de trabablho
WORKDIR /app

RUN \
  apt-get update  \
&&  apt-get install -y make ruby  ruby-dev build-essential \
&& gem install rails 
RUN apt-get install  -y  vlc 

RUN apt-get install gnupg

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 ubuntu
USER ubuntu
RUN gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN \curl -sSL https://get.rvm.io | bash -s stable --ruby
RUN echo "source $HOME/.rvm/scripts/rvm" >> ~/.bash_profile

RUN  rvm use 3.1.2
CMD rails s /app/sportsonline
# copia a aplicação sportsonline

COPY sportsonline /home/ubuntu/app


# inicia a aplicação 


