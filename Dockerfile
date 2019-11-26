FROM ruby:2.6

RUN apt-get install curl -y
RUN curl -sL https://deb.nodesource.com/setup_12.x | exec $SHELL
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update
RUN apt-get install zlib1g-dev build-essential libssl-dev libreadline-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn -y

RUN apt-get update && apt-get install default-mysql-client -y

RUN mkdir /forum-on-rails

WORKDIR /forum-on-rails
COPY Gemfile /forum-on-rails/Gemfile
COPY Gemfile.lock /forum-on-rails/Gemfile.lock

RUN gem install bundler
RUN bundle install

COPY . /forum-on-rails

RUN yarn add --dev @fortawesome/fontawesome-free bootswatch jquery bootstrap popper.js
RUN yarn install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
