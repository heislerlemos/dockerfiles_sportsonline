FROM ubuntu
WORKDIR /app
ENV TZ=Africa/Luanda
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN \
apt-get update  \
&&  apt-get install -y make ruby  ruby-dev build-essential curl  gnupg  libpq-dev\ 
&& gem install rails 
RUN  apt-get -y install postgresql-client
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 ubuntu
RUN gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
SHELL ["/bin/bash", "-l", "-c"]
RUN curl -sSL https://get.rvm.io | bash -s stable
ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN /bin/bash -l -c "rvm install 3.1.2"
RUN /bin/bash -l -c "rvm use 3.1.2"
RUN gem update --system
RUN gem install bundler 
RUN gem install rails -v "7.0.4"
COPY sportsonline /home/ubuntu/app
WORKDIR /home/ubuntu/app/sportsonline
RUN chmod -R 777 /usr/local/rvm/gems/ruby-3.1.2/
WORKDIR /home/ubuntu/app/sportsonline
RUN bundle install
EXPOSE  3000
USER ubuntu
USER root
CMD rails db:migrate
CMD rails s -b 0.0.0.0

