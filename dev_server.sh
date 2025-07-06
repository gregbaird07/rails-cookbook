#!/bin/bash
# Simple Rails development script for WSL2

# Set up Ruby environment
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Change to project directory
cd /mnt/c/Users/rgbai/Documents/code/family-projects/rails_cookbook

echo "Ruby version: $(ruby --version)"
echo "Rails version: $(rails --version)"
echo "Current directory: $(pwd)"

# Check if we can connect to PostgreSQL
echo "Checking PostgreSQL connection..."
if pg_isready -h localhost -p 5432 > /dev/null 2>&1; then
    echo "PostgreSQL is running!"
    
    # Try to create databases
    echo "Creating databases..."
    bundle exec rails db:create
    
    # Run migrations
    echo "Running migrations..."
    bundle exec rails db:migrate
    
    echo "Starting Rails server on http://localhost:3000"
    bundle exec rails server -b 0.0.0.0
else
    echo "PostgreSQL is not running or not accessible."
    echo "You can try starting it manually with: sudo service postgresql start"
    echo "Or configure Rails to use SQLite for development."
fi
