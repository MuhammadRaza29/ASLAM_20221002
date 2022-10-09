FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client


RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && \
    apt-get install -y yarn

WORKDIR /video-manager

COPY package.json /video-manager/package.json
COPY yarn.lock /video-manager/yarn.lock
RUN yarn install

COPY bin/webpack /video-manager/bin/webpack
COPY bin/webpack-dev-server /video-manager/bin/webpack-dev-server
COPY bin/yarn /video-manager/bin/yarn
COPY config/webpack/ /video-manager/config/webpack/

COPY Gemfile /video-manager/Gemfile
COPY Gemfile.lock /video-manager/Gemfile.lock
RUN bundle install

# Entry script
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
