class UserCommunitiesController < ApplicationController
  def create
  @user_community = UserCommunity.new(user_id:current_user.id, community_id:params[:id])
    if @user_community.save
      flash[:notice]="You are now subscribed!"
    else
      flash[:notice]="You are NOT subscribed! You did something wrong try again dummy!"
    end
    redirect_to community_path(@user_community.community_id)
  end
end
