FROM d11wtq/ruby
MAINTAINER Michael Sauter, mail@michaelsauter.net

RUN sudo apt-get install -y -q libpq-dev

CMD bundle install --path vendor/bundle && bundle exec rake db:migrate && bundle exec rackup