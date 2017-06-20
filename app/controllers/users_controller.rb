class UsersController < ApplicationController
  before_action :authenticated, except: [:new, :create]
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]=@user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:notice] = "Profile Updated Successfully!"
      redirect_to user_path(user)
    else
      render :edit
    end
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @following = @user.following
    render :following
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @followers = @user.followers
    render :followers
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :bio, :username)
  end
end
