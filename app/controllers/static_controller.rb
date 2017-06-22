class StaticController < ApplicationController
  def home
    render 'home'
  end

  def show
    @post = Post.find(params[:id])
    @date = @post.api_date_format[0]
    @event = @post.api_date_format[1]

  end
end
