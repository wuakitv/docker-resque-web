# Set the base image to Ruby:2.2
FROM ruby:2.2

# Install wget, sox and flite
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y zlib1g-dev build-essential && \
    gem install resque-web && \
    apt-get autoremove -y zlib1g-dev build-essential && \
    apt-get clean -y

ENTRYPOINT ["resque-web", "-FL"]
EXPOSE 5678

CMD ["-h"]

WORKDIR /data
