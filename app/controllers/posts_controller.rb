class PostsController < ApplicationController
  before_filter :set_post, :only => [:create, :show, :destroy, :update]

  def show
    redirect_to root unless @p
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.where("user_id = ?", current_user.id)
  end

  def destroy

  end

  private

  def set_post
    @p = Post.find(params[:id])
  end

end
