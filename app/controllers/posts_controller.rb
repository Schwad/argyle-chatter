class PostsController < ApplicationController
  # before_filter :set_post, :only => [:create, :show, :destroy, :update]
  before_filter :authenticate_user!

  def show
    @user = current_user
    @post = Post.find(params[:id])
  end

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def destroy
    @user = current_user
    @post = Post.find(params[:id])

    if @post.user_id != @user.id
      flash[:error] = "Unauthorized action"
      redirect_to root_path
    end

    @post.destroy
    redirect_to user_posts_path(@user.id)
    flash[:success] = "Post effectively destroyed!"

  end

  def edit
    @user = current_user
    @post = Post.find(params[:id])
    if @post.user_id != @user.id
      flash[:error] = "Unauthorized action"
      redirect_to root_path
    end
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def update
    @user = current_user
    @post = Post.find(params[:id])

    if @post.user_id != @user.id
      flash[:error] = "Unauthorized action"
      redirect_to root_path
    end

    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    @post.save
    flash[:success] = "Post updated!"
    redirect_to user_post_path(@user.id, @post.id)
  end

  def create

    @post = Post.new(
      :user_id => params[:user_id],
      :title => params[:post][:title],
      :body => params[:post][:body]
      )

    if @post.save
      flash[:success] = "Post created correctly!"
      redirect_to user_post_path(params[:user_id], @post.id)
    else
      flash[:error] = "Post did not save correctly!"
      redirect_to root_path
    end
  end


  private

  def set_post
    begin
      @post = Post.find(params[:id])
    rescue
      flash[:error] = "Post does not exist"
      redirect_to root_path
    end
  end
end
