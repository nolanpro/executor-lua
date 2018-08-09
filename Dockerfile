# Bring in from base debian docker image
FROM debian:9.5

# Copy over our LUA libraries/runtime
COPY ./src /opt/executor

# Set working directory to our /opt/executor location
WORKDIR /opt/executor

LABEL maintainer="taylor@processmaker.com"

# Update packages, then install lua
RUN apt-get update -qq && apt-get install -y lua5.3 luarocks liblua5.3-dev

RUN luarocks install dkjson 

