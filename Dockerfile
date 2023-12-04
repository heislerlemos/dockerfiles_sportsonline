# Verificar a imagem do ambiente do os 
FROM ubuntu
# Difine o directorio de trabablho
WORKDIR /app

ENV TZ=Africa/Luanda
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN \
apt-get update  \
&&  apt-get install -y make ruby  ruby-dev build-essential curl  gnupg  libpq-dev\ 
&& gem install rails 
RUN echo "1" | apt-get -y install  postgresql postgresql-contrib 


RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 ubuntu
RUN gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
# começa a utilizar o bash
SHELL ["/bin/bash", "-l", "-c"]
RUN curl -sSL https://get.rvm.io | bash -s stable
#Set env just in case
ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN /bin/bash -l -c "rvm install 3.1.2"
#RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
RUN /bin/bash -l -c "rvm use 3.1.2"
# Instala a versão do rails ident
RUN  gem update --system
RUN gem install bundler 
RUN gem install rails -v "7.0.4"
# copia a aplicação sportsonline no docker
COPY sportsonline /home/ubuntu/app
# mete a estação de trabalho do app
WORKDIR /home/ubuntu/app/sportsonline
#RUN chmod -R 777 /home/ubuntu/app/sportsonline
RUN chmod -R 777 /usr/local/rvm/gems/ruby-3.1.2/
# muda de usario
#atualiza os pacotes da biblioteca
#reconfigura a base dados

WORKDIR /home/ubuntu/app/sportsonline
#RUN touch /home/ubuntu/app/log/development.log
#RUN chmod 777 /home/ubuntu/app/log/development.log

USER ubuntu
RUN bundle install
EXPOSE  3000
USER root
CMD rails s -b 0.0.0.0

# Para correr o docker sudo docker run -p 1000:3000 sportsonline:v1 
# sudo docker build . -t sportsonline:v1
# e aceda na no url 0.0.0.0:1000 
