# Resque Web in Docker
This project is a Docker container for a Rails project with Resque Web.
	
## Using the container

Run the container with the same options you use for resque-web. The options -F (run in foreground) and -L (do not launch browser) are included by default.
If no options are provided, the help screen for resque-web will be displayed.

To run it once

    docker run --rm -p 3000:3000 -v $(pwd):/resque-web-wrapper -e RAILS_RESQUE_REDIS=172.17.0.3:6379 -e RAILS_RESQUE_REDIS_NAMESPACE=development:gizmo resque-web-wrapper

To run the container as a background process run
    
    docker run --rm **-d --restart=always --name resque-web-wrapper** -p 3000:3000 -v $(pwd):/resque-web-wrapper -e RAILS_RESQUE_REDIS=172.17.0.3:6379 -e RAILS_RESQUE_REDIS_NAMESPACE=development:gizmo resque-web-wrapper

**NB:** In the above example, replace `172.17.0.3` with the ip address/hostname of your redis server.
