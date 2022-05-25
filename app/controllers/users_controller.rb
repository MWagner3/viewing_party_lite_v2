class UsersController < ApplicationController
  def new

  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to "/users/#{@user.id}"
    else
      flash.now[:user_errors] = 'User Not Registered'
      render :new
    end
  end

  def login_form

  end

  def login_user
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      redirect_to "/users/#{@user.id}", notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :login_form
    end
  end

  private

  def user_params
      params.permit(:name, :email, :password, :password_confirmation)
  end
end
