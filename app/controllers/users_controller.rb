class UsersController < ApplicationController
  before_action :authenticated, except: [:new, :create]

  def index
    @users_search = User.all.search(params[:search]).order("created_at DESC")
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    # @post = current_user.posts.build
    @feed_items = []
    @feed_items << @user.posts
    if @user.following
      @user.following.each do |user|
        @feed_items << user.posts
      end
    end
    @feed_items.flatten!
    @feed_items.sort_by! { |x| x.created_at }
    @feed_items.reverse!
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Sign Up Successful!"
      session[:user_id]=@user.id
      redirect_to user_path(@user)
    else
      if @user.errors.any?
        flash[:notice] = @user.errors.full_messages
      end
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
      if user.errors.any?
        flash[:notice] = user.errors.full_messages
      end
      render :edit
    end
  end

  def following
    @user = User.find(params[:id])
    @following = @user.following
    render :following
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.followers
    render :followers
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :bio, :username)
  end
end
