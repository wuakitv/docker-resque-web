# Set the base image to Ruby:2.2
FROM ruby:2.3.7-alpine

# Install wget, sox and flite
RUN apk update && \
    apk add g++ make && \
    gem install redis -v 3.3.3 && \
    gem install redis-namespace -v 1.6.0 && \
    gem install resque-web -v 0.0.11 && \
    apk del g++ make

ENTRYPOINT ["resque-web", "-FL"]
EXPOSE 5678

CMD ["-h"]

