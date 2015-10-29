class PostsController < ApplicationController
  # before_filter :set_post, :only => [:create, :show, :destroy, :update]

  def show
    set_post
  end

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def destroy

  end

  def new
    set_post
    @user = User.find(params[:user_id])
  end

  def create
    @post = Post.new post_params

    if @post.save
      redirect_to @post
    else
      flash[:error] = "Post did not save correctly!"
      redirect_to root_path
    end
  end

  def update
    set_post
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :title, :body)
  end

  def set_post
    begin
      @post = Post.find(params[:id])
    rescue
      flash[:error] = "Post does not exist"
      redirect_to root_path
    end
  end
end
