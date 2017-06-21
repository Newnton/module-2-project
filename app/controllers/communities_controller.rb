class CommunitiesController < ApplicationController
  before_action :authenticated, except: [:index]

  def index
    @communities = Community.all
    if params[:search]
      @communities_search = Community.all.search(params[:search]).order("created_at DESC")
    else
      @posts = Post.all.order('created_at DESC')
    end
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
      if @community.save
        flash[:notice] = "Community Successfully Created!"
        redirect_to communities_path
      else
        if @community.errors.any?
          flash[:notice] = @community.errors.full_messages
        end
          render :new
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

  # def search(search)
  #   where("name LIKE ? OR description LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%")
  # end

  def community_params
    params.require(:community).permit(:name, :description, :search)
  end
end
