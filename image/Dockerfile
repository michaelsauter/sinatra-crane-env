FROM       michaelsauter/ruby:2.2.2
MAINTAINER Michael Sauter <mail@michaelsauter.net>

RUN sudo apk-install build-base postgresql-dev

ADD bin/start-blog /usr/local/bin/start-blog
RUN sudo chmod 0755 /usr/local/bin/start-blog

ENV PATH .bundle/bin:$PATH

WORKDIR /blog

CMD ["start-blog"]