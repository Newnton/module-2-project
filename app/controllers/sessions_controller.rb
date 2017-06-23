class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email:params[:user][:email])
    if !user.nil? && user.authenticate(params[:user][:password])
      if user.errors.any?
        flash[:notice] = user.errors.full_messages
      else
        flash[:notice] = "Sign in Successful!"
        session[:user_id]=user.id
        redirect_to user_path(user)
      end
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id]=nil
    redirect_to root_path
  end

  def error
    render 'error'
  end

end
