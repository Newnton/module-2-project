class CommunitiesController < ApplicationController
  before_action :authenticated, except: [:index]

  def index
    @communities = Community.all
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
      if @community.save
        UserCommunity.new(user_id: current_user.id, community_id: @community.id, admin: true)
        flash[:notice] = "Community Successfully Created!"
        redirect_to communities_path
      else
        if @community.errors.any?
          flash[:notice] = @community.errors.full_messages
        end
          render :new
      end
  end

  def edit
    @community = Community.find(params[:id])
    verify_admin(@community)
  end

  def update
    @community = Community.find(params[:id])
    if @community.update(community_params)
      flash[:notice] = 'updated community'
      redirect_to community_path(@community)
    else
      render :edit
    end
  end

  def show
    @community = Community.find(params[:id])
  end

  def destroy
    @community = Community.find(params[:id])
    @community.destroy
    redirect_to communities_path
  end



  private

  def community_params
    params.require(:community).permit(:name, :description)
  end

end
