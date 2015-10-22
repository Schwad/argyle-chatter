class CommentsController < ApplicationController

  before_filter :set_comment, :only => [:create, :show, :update, :destroy]

  def show
    flash[:error] = "Cannot find the comment!" unless @c
  end

  def update
  end

  def destroy
  end

  private

  def set_comment
    @c = Comment.find(params[:id])
  end
end
