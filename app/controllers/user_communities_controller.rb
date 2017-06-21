class UserCommunitiesController < ApplicationController
  before_action :authenticated
  def create
  @user_community = UserCommunity.new(user_id:current_user.id, community_id:params[:id])
    if UserCommunity.find_by(user_id: current_user.id, community_id: params[:id]).nil?
      @user_community.save
      flash[:notice]="You are now subscribed!"
    else
      flash[:notice]="You are already subscribed to this community."
    end
    redirect_to community_path(@user_community.community_id)
  end

  def destroy
    @uc = UserCommunity.find_by(user_id: current_user.id, community_id: params[:id])
    @uc.destroy
    flash[:notice] = "Unsubscribe Successful!"
    redirect_to user_path(current_user)
  end

end
