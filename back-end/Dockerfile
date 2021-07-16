FROM ruby:2.6.6

RUN apt-get update -yqq \ 
    && apt-get install -yqq \
        postgresql-client \
        libpq-dev

WORKDIR /usr/src/app 

COPY Gemfile* ./

RUN bundle install 

COPY . .

EXPOSE 3000

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["puma", "-C", "config/puma.rb"]
