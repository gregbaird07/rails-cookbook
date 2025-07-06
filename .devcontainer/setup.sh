#!/bin/bash

echo "🚀 Setting up Rails Cookbook in Codespaces..."

# Install Rails if not present
if ! command -v rails &> /dev/null; then
    echo "📦 Installing Rails 8..."
    gem install rails -v 8.0.2
fi

# Install dependencies
echo "📦 Installing gems..."
bundle install

# Setup database
echo "🗄️ Setting up database..."
rails db:create
rails db:migrate

# Check if we have any users
user_count=$(rails runner "puts User.count" 2>/dev/null || echo "0")

if [ "$user_count" = "0" ]; then
    echo "👤 Creating demo user..."
    rails runner "
    User.create!(
      email: 'demo@example.com',
      first_name: 'Demo',
      last_name: 'User',
      password: 'password123',
      password_confirmation: 'password123'
    )
    puts 'Demo user created: demo@example.com / password123'
    "
fi

echo "✅ Rails Cookbook is ready!"
echo "🌐 Start the server with: rails server"
echo "👤 Demo login: demo@example.com / password123"
