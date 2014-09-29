FROM       pandrew/ubuntu-lts
MAINTAINER Abe Voelker <abe@abevoelker.com>

RUN apt-get update

RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl

#RUN apt-get install -qqy build-essential libssl-dev zlib1g-dev

RUN git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
#RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
ENV PATH $HOME/.rbenv/bin:$PATH
RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc
#RUN eval "$(rbenv init -)"
RUN exec $SHELL -l

RUN git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
RUN ~/.rbenv/plugins/ruby-build/install.sh
# RUN echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
ENV PATH $HOME/.rbenv/plugins/ruby-build/bin:$PATH


RUN git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
RUN git clone https://github.com/ianheggie/rbenv-binstubs.git ~/.rbenv/plugins/rbenv-binstubs

RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc
RUN eval rbenv init -

RUN rbenv install 2.1.2
RUN rbenv global 2.1.2
RUN rbenv rehash

RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc

RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y nodejs

RUN gem install rails
RUN rbenv rehash

RUN gem install bundler

RUN rbenv rehash

RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y postgresql libpq-dev

RUN mkdir -p /root/.ssh/
ADD .ssh/id_rsa.pub /root/.ssh/id_rsa

RUN mkdir /var/www/
RUN git clone git@github.com:joegesualdo/weather-wear.git /var/www/weather-wear

RUN /etc/init.d/postgresql start && psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &
RUN sudo -u postgres psql --command "create user \"root\" with superuser"

RUN sudo -u postgres psql --command "UPDATE pg_database SET datistemplate = FALSE WHERE datname = 'template1';DROP DATABASE template1; CREATE DATABASE template1 WITH TEMPLATE = te

WORKDIR /var/www"
