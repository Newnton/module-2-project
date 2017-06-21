class RelationshipsController < ApplicationController
  before_action :authenticated

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    flash[:notice] = "Follow Successful!"
    redirect_to user
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    flash[:notice] = "Unfollow Successful!"
    redirect_to user
  end

end
