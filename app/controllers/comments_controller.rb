class CommentsController < ApplicationController
  before_action :authenticated

  def new
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post_id)
    else
      render :new
    end
  end

  def edit
    @comment = current_comment
  end

  def update
    @comment = current_comment
    if @comment.update(comment_params)
      redirect_to comment_path(@comment)
    else
      render :edit
    end
  end

  def show
    @comment = current_comment
  end

  def destroy
    @comment = current_comment
    @comment.delete
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end

  def current_comment
    Comment.find(params[:id])
  end
end
