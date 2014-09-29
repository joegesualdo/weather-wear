FROM       polleverywhere/rbenv
MAINTAINER Joe Gesualdo <joe@gesualdo.com>

RUN apt-get update

RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev curl software-properties-common python-software-properties postgresql libpq-dev nodejs

# Another way to install postgres, possibly better than installing it with apt-get like we did above
#RUN DEBIAN_FRONTEND="noninteractive" add-apt-repository ppa:pitti/postgresql

# install a ruby version and set it to the global version
RUN rbenv install 2.1.2
RUN rbenv global 2.1.2
RUN rbenv rehash

# configure rubygems
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# install rails
RUN gem install rails
RUN rbenv rehash

# install bundler
RUN gem install bundler
RUN rbenv rehash

# TODO: Refactor this into an ansible task
#RUN mkdir -p /root/.ssh/
#ADD .ssh/id_rsa /root/.ssh/id_rsa
#ADD .ssh/known_hosts /root/.ssh/know_hosts
# RUN chmod 700 /root/.ssh/id_rsa

# TODO: Refactor this into an ansible task
#RUN git clone git@github.com:joegesualdo/weather-wear.git /var/www/weather-wear


# TODO: Refactor this into an ansible task
#RUN ln -s /tmp/.s.PGSQL.5432 /var/run/postgresql/.s.PGSQL.5432
#RUN /etc/init.d/postgresql start
# RUN psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &
#RUN sudo -u postgres psql --command "create user \"root\" with superuser"

#RUN sudo -u postgres psql --command "UPDATE pg_database SET datistemplate = FALSE WHERE datname = 'template1';DROP DATABASE template1; CREATE DATABASE template1 WITH TEMPLATE = te

RUN mkdir /var/www/
WORKDIR /var/www
