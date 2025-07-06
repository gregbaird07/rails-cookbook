#!/bin/bash
# Rails development environment setup script for WSL2

# Set up Ruby environment
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Change to project directory
cd /mnt/c/Users/rgbai/Documents/code/family-projects/rails_cookbook

# Export the script directory for easy access
export RAILS_ROOT=$(pwd)

# Start PostgreSQL service if not running
if ! sudo service postgresql status > /dev/null 2>&1; then
    echo "Starting PostgreSQL..."
    sudo service postgresql start
fi

# Create databases if they don't exist
echo "Setting up databases..."
bundle exec rails db:create 2>/dev/null || echo "Databases may already exist"

# Run any pending migrations
echo "Running migrations..."
bundle exec rails db:migrate

# Start the Rails server
echo "Starting Rails server..."
bundle exec rails server -b 0.0.0.0
