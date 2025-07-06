#!/bin/bash
# Quick start script for Rails development with SQLite

# Set up Ruby environment
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Change to project directory
cd /mnt/c/Users/rgbai/Documents/code/family-projects/rails_cookbook

echo "Setting up Rails with SQLite for quick development..."

# Backup current database.yml and use SQLite version
cp config/database.yml config/database_postgresql.yml.backup
cp config/database_sqlite.yml config/database.yml

# Add sqlite3 gem to Gemfile if not present
if ! grep -q "gem ['\"]sqlite3['\"]" Gemfile; then
    echo "Adding sqlite3 gem to Gemfile..."
    sed -i '/gem ['\''"]pg['\''"]/ a gem "sqlite3"' Gemfile
fi

# Install gems
echo "Installing gems..."
bundle install

# Create and migrate databases
echo "Creating database..."
bundle exec rails db:create

echo "Running migrations..."
bundle exec rails db:migrate

echo "Rails 8 development server is ready!"
echo "Starting server on http://localhost:3000"
echo "Press Ctrl+C to stop the server"
echo ""

# Start the Rails server
bundle exec rails server -b 0.0.0.0
