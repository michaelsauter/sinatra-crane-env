# Sinatra Docker environment
Sample Sinatra blog using [Crane](https://github.com/michaelsauter/crane) to
orchestrate the Docker containers.

## Usage

```bash
git clone git@github.com:michaelsauter/sinatra-crane-env.git
cd sinatra-crane-env
crane lift blog
```

After all images are downloaded and the server has started, try to access
`<dockerhost>:9292`. As the app container bind-mounts `blog`, you can edit e.g.
`blog/app.rb` and see the changes take effect immediately.