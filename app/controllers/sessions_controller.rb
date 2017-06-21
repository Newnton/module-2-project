class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email:params[:user][:email])
    if !user.nil? && user.authenticate(params[:user][:password])
      flash[:notice] = "Sign in Successful!"
      session[:user_id]=user.id
      redirect_to user_path(user)
    else
      if user.errors.any?
        flash[:notice] = user.errors.full_messages
      end
      render 'new'
    end
  end

  def destroy
    session[:user_id]=nil
    redirect_to root_path
  end


end
