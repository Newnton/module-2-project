class CommunitiesController < ApplicationController

  def index
    @communities = Community.all
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
      if @community.save
        flash[:success] = "Community Successfully Created!"
        redirect_to communities_path
      else
        if @community.errors.any?
          flash[:error] = @community.errors.full_messages
          render :new
        end
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
