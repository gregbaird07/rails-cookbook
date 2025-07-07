class SessionsController < ApplicationController
  def new
    # Login form
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Successfully logged in!'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    user_name = current_user&.first_name
    session[:user_id] = nil
    redirect_to root_path, notice: "Successfully logged out#{user_name ? ", #{user_name}" : ''}! See you next time! 👋"
  end
end
