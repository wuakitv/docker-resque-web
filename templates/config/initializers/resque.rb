# Setup resque's redis
Resque.redis = ENV['RESQUE_REDIS_URL']
Resque.redis.namespace = ENV['RESQUE_REDIS_NAMESPACE']
