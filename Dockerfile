# Bring in from base debian docker image
FROM debian:9.5

# Update packages, then install lua
RUN apt-get update -qq
RUN apt-get install -y lua5.3 luarocks liblua5.3-dev build-essential libssl-dev m4

# Copy over our LUA libraries/runtime
COPY ./src /opt/executor

# Copy over our LUA SDK 
COPY ./sdk-repo /opt/executor/sdk-repo

# Build the sdk and save it in luarocks default folder
WORKDIR /opt/executor/sdk-repo
RUN luarocks make --local

# Set working directory to our /opt/executor location
WORKDIR /opt/executor

LABEL maintainer="taylor@processmaker.com"

RUN luarocks install dkjson