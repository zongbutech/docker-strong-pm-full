FROM node:5
MAINTAINER sqlwwx <wwx_2012@hotmail.com>

RUN useradd -ms /bin/bash strong-pm \
    && chown -R strong-pm:strong-pm /usr/local \
    && su strong-pm -c "npm install -g strong-pm && npm cache clear"
RUN echo "\n###########\n1. install strong-pm\n"

# redis
RUN echo "\n###########\n1. install redis\n"
# mongodb
RUN echo "\n###########\n1. install mongodb\n"
# nginx
RUN echo "\n###########\n1. install nginx\n"

# Bundle app source
# ADD . /src
# Install app dependencies
# RUN cd /src; npm install

# Set up some semblance of an environment
WORKDIR /home/strong-pm
ENV HOME=/home/strong-pm

# Run as non-privileged user inside container
USER strong-pm

# Expose strong-pm port
EXPOSE 8701 3000 3001 3002 3003 80

ENTRYPOINT ["/usr/local/bin/sl-pm", "--base", ".", "--listen", "8701"]
