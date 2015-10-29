class StaticPagesController < ApplicationController
  def index

    if current_user
      @user = current_user
    else
      @user = nil
    end

    @posts = Post.all
  end
end
