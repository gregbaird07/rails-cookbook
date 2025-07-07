# 🚀 Rails Cookbook - Codespaces Setup

## Quick Start with GitHub Codespaces

1. **Push this code to GitHub** (if not already there)
2. **Open in Codespaces:**

   - Go to your GitHub repository
   - Click the green "Code" button
   - Select "Codespaces" tab
   - Click "Create codespace on main"

3. **Wait for setup** (automatic):

   - Environment will be configured
   - Rails 8 will be installed
   - Database will be created and migrated
   - Demo user will be created

4. **Start the server:**

   ```bash
   rails server
   ```

5. **Access your app:**
   - Codespaces will automatically forward port 3000
   - Click the popup notification or check the Ports tab

## Demo Account

- **Email:** demo@example.com
- **Password:** password123

## What's Included

✅ **Authentication System:**

- User registration and login
- Secure password handling with bcrypt
- Session management
- Profile management

✅ **Modern UI:**

- Bootstrap 5 styling
- Responsive design
- Flash messages
- Navigation system

✅ **Rails 8 Features:**

- Latest Rails version
- Importmap for JavaScript
- Modern asset pipeline
- SQLite for development

## Next Steps

Once your Codespace is running, you can:

1. **Test the authentication:**

   - Visit the home page
   - Sign up for a new account
   - Login/logout functionality

2. **Add new features:**

   - Recipe models and controllers
   - Image uploads
   - Recipe categories
   - User favorites

3. **Customize the design:**
   - Update the CSS styles
   - Add more pages
   - Implement additional features

## Troubleshooting

If something goes wrong:

```bash
# Reset the database
rails db:reset

# Reinstall gems
bundle install

# Check Rails version
rails --version

# View logs
rails server --verbose
```

## Development Commands

```bash
# Generate a new controller
rails generate controller Recipes index show new create edit update destroy

# Generate a new model
rails generate model Recipe title:string description:text instructions:text user:references

# Run migrations
rails db:migrate

# Open Rails console
rails console

# Run tests
rails test
```

Happy coding! 🎉
