# Set the base image to Ruby:2.2
FROM ruby:2.5.1-alpine

# Install wget, sox and flite
RUN apk update && \
    apk add g++ make && \
    gem install resque-web -v 0.0.12 && \
    apk del g++ make

ENTRYPOINT ["resque-web", "-FL"]
EXPOSE 5678

CMD ["-h"]

WORKDIR /data
