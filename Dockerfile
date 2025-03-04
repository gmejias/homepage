# Dockerfile

FROM ruby:2.6.3

WORKDIR /app

RUN curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh  && \
    bash nodesource_setup.sh && \
    apt install nodejs

# Copy Ruby and Node dependencies
COPY Gemfile Gemfile.lock package.json package-lock.json ./

# Install dependencies
RUN bundle install --without debug && npm install

EXPOSE 4567