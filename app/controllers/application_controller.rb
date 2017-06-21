class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :authenticated, :current_user?, :is_admin?, :verify_admin

  def current_user
    @current_user ||= User.find_by(id:session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authenticated
    if !logged_in?
      flash[:notice] = "You must be logged in to access that feature."
      redirect_to root_path
    end
  end

  def current_user?(user)
   user == current_user
  end

 def is_admin?(community)
   uc = UserCommunity.find_by(user_id: current_user.id, community_id: community.id)
   if uc && uc.admin
     return true
   else
     return false
   end
 end

 def verify_admin(community)
   if !is_admin?(community)
     flash[:notice] = "you are not an admin"
     redirect_to community_path(community)
   end
 end

end
