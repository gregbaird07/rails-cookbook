class HomeController < ApplicationController
  def index
    # Landing page - show different content based on login status
    if logged_in?
      @welcome_message = "Welcome back, #{current_user.first_name}!"
    else
      @welcome_message = "Welcome to Rails Cookbook!"
    end
  end
end
