FROM ruby:2.5.1-slim

# Install the dependencies
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
    build-essential libpq-dev imagemagick curl

# Install the GNUPG
RUN apt-get install -y gnupg

# Install NodeJS v8
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs

# Install o Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y yarn

# Set the path
ENV INSTALL_PATH /sales-management

# Create new directory
RUN mkdir -p $INSTALL_PATH

# Set our patch as the main directory
WORKDIR $INSTALL_PATH

# Copy our Gemfile into the container
COPY Gemfile ./

# Set path to Gems
ENV BUNDLE_PATH /box

# Copy our code into the container
COPY . .