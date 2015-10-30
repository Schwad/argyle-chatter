class CommentsController < ApplicationController


  def show
    flash[:error] = "Cannot find the comment!" unless @c
  end

  def new
    @user = current_user
    @post = Post.find(params[:format])
    @comment = Comment.new

  end

  def edit
    @user = current_user
    @comment = Comment.find(params[:id])
    if @comment.user_id != @user.id
      flash[:error] = "Unauthorized action"
      redirect_to root_path
    end
  end

  def update
    @user = current_user
    @comment = Comment.find(params[:id])
    @post = @comment.post

    if @comment.user_id != @user.id
      flash[:error] = "Unauthorized action"
      redirect_to root_path
    end

    @comment.body = params[:comment][:body]
    @comment.save
    flash[:success] = "Post updated!"
    redirect_to user_post_path(@user.id, @post.id)

  end


  def create
    @comment = Comment.new(
      :user_id => params[:comment][:user_id],
      :post_id => params[:comment][:post_id],
      :body => params[:comment][:body]
      )

    @post = Post.find(params[:comment][:post_id])

    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to user_post_path(@post.user_id, @post.id)
    else
      flash[:error] = "Comment did not save correctly!"
      redirect_to root_path
    end

  end

  def index
    @user = current_user
    @comments = @user.comments

  end


  def destroy
    @user = current_user
    @comment = Comment.find(params[:id])

    if @comment.user_id != @user.id
      flash[:error] = "Unauthorized action"
      redirect_to root_path
    end

    @comment.destroy
    redirect_to user_comments_path(@user.id)
    flash[:success] = "Comment effectively destroyed!"

  end

  private


end
