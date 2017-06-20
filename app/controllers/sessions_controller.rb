class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(email:params[:user][:email])
    if !user.nil? && user.authenticate(params[:user][:password])
      session[:user_id]=user.id
      redirect_to communities_path
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id]=nil
    redirect_to root_path
  end


end
