class PostsController < ApplicationController
  before_filter :set_post, :only => [:create, :show, :destroy, :update]

  def show
    flash[:error] = "Can't find Blog Post" unless @p
  end

  def index
    @posts = Post.all
  end

  def destroy

  end

  private

    def set_post
      @p = Post.find(params[:id])
    end

end
