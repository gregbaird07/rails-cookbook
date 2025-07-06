# Rails Cookbook

A Rails 8 application with user authentication and modern UI.

## 🚀 Easiest Way to Get Started: GitHub Codespaces

**Recommended for quick setup:**

1. Push this code to a GitHub repository
2. Click the green "Code" button → "Codespaces" → "Create codespace"
3. Wait 2-3 minutes for automatic setup
4. Run `rails server` and start coding!

👤 **Demo Login:** demo@example.com / password123

[📖 Full Codespaces Guide](CODESPACES.md)

---

## Alternative: Local Development (WSL2)

This project can also run in WSL2 (Windows Subsystem for Linux) with Ubuntu.

### Prerequisites

- Windows 10/11 with WSL2 enabled
- Ubuntu distribution in WSL2
- Ruby 3.3.8 (installed via rbenv)
- Rails 8.0.2
- SQLite3 (for development)
- PostgreSQL (for production)

### Getting Started

#### Option 1: Quick Start (SQLite)

For rapid development, use the quick start script that sets up SQLite:

```bash
# From Windows PowerShell/Command Prompt
wsl -d Ubuntu -- bash /mnt/c/Users/rgbai/Documents/code/family-projects/rails_cookbook/quick_start.sh
```

This will:

- Switch the database configuration to SQLite
- Install required gems
- Create and migrate the database
- Start the Rails server on http://localhost:3000

#### Option 2: Full PostgreSQL Setup

If you prefer to use PostgreSQL for development:

1. Start PostgreSQL service in WSL2:

```bash
sudo service postgresql start
```

2. Create a PostgreSQL user:

```bash
sudo -u postgres createuser -s greg
```

3. Start the Rails server:

```bash
wsl -d Ubuntu -- bash /mnt/c/Users/rgbai/Documents/code/family-projects/rails_cookbook/dev_server.sh
```

### VS Code Integration

A VS Code task has been created for running the Rails server:

1. Open VS Code in the project directory
2. Use `Ctrl+Shift+P` and run "Tasks: Run Task"
3. Select "Start Rails Server"

### Project Structure

This is a standard Rails 8 application with:

- **App Structure**: Standard Rails MVC architecture
- **Database**: SQLite for development (easily switchable to PostgreSQL)
- **Asset Pipeline**: Importmap for JavaScript modules
- **CSS**: Standard Rails asset pipeline
- **Testing**: Minitest (Rails default)
- **Deployment**: Kamal configuration included
- **Docker**: Dockerfile included for containerization

### Development Scripts

- `quick_start.sh`: Sets up SQLite and starts the server
- `dev_server.sh`: Starts with PostgreSQL configuration
- `start_rails.sh`: Full setup with PostgreSQL service management

### Database Configuration

The project includes two database configurations:

- `config/database.yml`: PostgreSQL configuration (production-ready)
- `config/database_sqlite.yml`: SQLite configuration (development-friendly)

### Key Features

- **Rails 8**: Latest Rails version with new features
- **Modern JavaScript**: Importmap for ES modules
- **CSS**: Standard Rails asset pipeline
- **PWA Ready**: Service worker and manifest included
- **Docker Ready**: Dockerfile and .dockerignore included
- **CI/CD**: GitHub Actions workflow included
- **Code Quality**: RuboCop configuration included
- **Deployment**: Kamal configuration for easy deployment

### Common Commands

```bash
# Start development server
./quick_start.sh

# Run tests
wsl -d Ubuntu -- bash -c "cd /mnt/c/Users/rgbai/Documents/code/family-projects/rails_cookbook && bundle exec rails test"

# Generate a new controller
wsl -d Ubuntu -- bash -c "cd /mnt/c/Users/rgbai/Documents/code/family-projects/rails_cookbook && bundle exec rails generate controller Pages home"

# Generate a new model
wsl -d Ubuntu -- bash -c "cd /mnt/c/Users/rgbai/Documents/code/family-projects/rails_cookbook && bundle exec rails generate model Article title:string content:text"

# Run migrations
wsl -d Ubuntu -- bash -c "cd /mnt/c/Users/rgbai/Documents/code/family-projects/rails_cookbook && bundle exec rails db:migrate"

# Open Rails console
wsl -d Ubuntu -- bash -c "cd /mnt/c/Users/rgbai/Documents/code/family-projects/rails_cookbook && bundle exec rails console"
```

### Accessing the Application

Once the server is running, you can access your Rails application at:

- **Development**: http://localhost:3000
- **WSL2 IP**: The server binds to 0.0.0.0 so it's accessible from Windows

### Troubleshooting

1. **Ruby not found**: Make sure rbenv is properly set up in your shell
2. **Database connection issues**: Check if PostgreSQL is running or switch to SQLite
3. **Permission issues**: Ensure the scripts are executable (`chmod +x *.sh`)
4. **Port conflicts**: Rails runs on port 3000 by default, change if needed

### Next Steps

1. Generate your first controller and views
2. Set up your models and migrations
3. Add authentication (consider Devise gem)
4. Style your application with CSS or a framework
5. Add tests for your features
6. Deploy to production using Kamal

Happy coding!
