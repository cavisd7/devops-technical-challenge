# Get correct version of ruby image
FROM ruby:2.6.6

# Install dependencies (libpq-dev needed for postgres gem)
RUN apt-get update -yqq \ 
    && apt-get install -yqq \
        postgresql-client \
        libpq-dev

# Set working directory
WORKDIR /usr/src/app 

# Copy Gemfile and Gemfile.lock 
COPY Gemfile* ./

# Install dependencies 
RUN bundle install 

# Copy app
COPY . .

# Expose port 3000 on container
EXPOSE 3000

# Copy and set entrypoint
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Default instruction passed to entrypoint.sh to start server
CMD ["puma", "-C", "config/puma.rb"]
