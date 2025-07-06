class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:new, :create]
  before_action :require_same_user, only: [:show, :edit, :update, :destroy]

  def show
    # User profile page
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Account created successfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # Edit user profile
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Profile updated successfully!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Account deleted successfully!'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end

  def require_same_user
    if current_user != @user
      redirect_to root_path, alert: 'You can only access your own profile!'
    end
  end
end
