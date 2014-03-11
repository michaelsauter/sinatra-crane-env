# Sinatra Docker environment
To make things easier, this is using [Crane](https://github.com/michaelsauter/crane) to orchestrate the Docker containers.

## What's included?
The environment consists of 2 containers: the sample app (based on [d11wtq/ruby](http://github.com/d11wtq/ruby-docker)) and a PostgreSQL database (based on [orchardup/postgresql](http://github.com/orchardup/postgresql)).

## Requirements
[Docker](https://github.com/dotcloud/docker) and [Crane](https://github.com/michaelsauter/crane). If you're on OS X and have no Docker environment setup yet, I recommend [docker-osx](https://github.com/noplay/docker-osx). [boot2docker](https://github.com/boot2docker/boot2docker) is nice, but unfortunately, it does not support bind-mounting volumes yet so it can't be used for this example.

## Usage
* `git clone git@github.com:michaelsauter/sinatra-crane-env.git`
* `cd sinatra-crane-env`
* `crane lift`

That will build the images and run the containers. Note that on the first run, the server container will need to install the dependencies, so even after the containers are started, the app cannot be accessed until `bundle install` finishes. Use `docker logs -f sinatra_app` to see the progress. After the autoload files are generated, try to access `<dockerhost>:9292`. As the app container bind-mounts `app`, you can edit e.g. `app/app.rb` and see the changes take effect immediately.