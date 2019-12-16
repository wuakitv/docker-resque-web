# Resque Web in Docker

This project is a Docker container to have resque-web interface without attaching it to your real application.

As resque-web is a Rails engine, we create a sample app with everything needed.

## Using the container

1. Build the image

    docker build .

2. Run it

    docker run IMAGE_ID -e RESQUE_REDIS_URL='redis://redis' -e RESQUE_REDIS_NAMESPACE='my_namespace'

Image will listen on port 80.

# Use a resque-web branch

The branch has to be indicated on-build:

    docker build --build-arg GEMFILE_EXTRA_REPO_SETUP=", git: 'https://github.com/somebody/resque-web.git', branch: 'my-custom-branch'"
