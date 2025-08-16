# Simple Rails API Dockerfile
FROM ruby:3.4.4-slim

# Install minimal system dependencies including libyaml-dev for psych gem and postgresql
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    libyaml-dev \
    pkg-config \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /rails

# Install bundler
RUN gem install bundler

# Copy Gemfile and install gems
COPY Gemfile ./
RUN bundle install

# Copy the rest of the application
COPY . .

# Expose port 3000
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
