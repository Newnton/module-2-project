class PostsController < ApplicationController

  def new
    @community = Community.find(params[:id])
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = current_post
  end

  def update
    @post = current_post
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def show
    @post = current_post
  end


  def destroy
    @post = current_post
    @post.delete
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :user_id, :community_id)
  end

  def current_post
    Post.find(params[:id])
  end

end
