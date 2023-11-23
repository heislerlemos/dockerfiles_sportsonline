# Verificar a imagem do ambiente do os 
FROM ubuntu


# Difine o directorio de trabablho
WORKDIR /app

RUN \
  apt-get update  \
&&  apt-get install -y make ruby  ruby-dev build-essential curl \
&& gem install rails 
 

RUN apt-get install gnupg

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 ubuntu

RUN gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
SHELL ["/bin/bash", "-l", "-c"]
RUN curl -sSL https://get.rvm.io | bash -s stable
#Set env just in case
ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
#RUN /bin/bash -l -c "rvm requirements  "
RUN /bin/bash -l -c "rvm install 3.1.2"
#RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
RUN /bin/bash -l -c "rvm use 3.1.2"
RUN gem install rails -v "7.0.4"
#CMD rails s /app/sportsonline
# copia a aplicação sportsonline

COPY sportsonline /home/ubuntu/app
CMD ls /home/ubuntu/app && pwd
WORKDIR /home/ubuntu/app/sportsonline
CMD pwd 
CMD ruby -v
USER ubuntu
CMD bundle -y 
# inicia a aplicação 


