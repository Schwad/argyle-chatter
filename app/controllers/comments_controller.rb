class CommentsController < ApplicationController

  before_filter :set_comment, :only => [:create, :show, :update, :destroy]

  def show
    flash[:error] = "Cannot find the comment!" unless @c
  end

  def update
    begin
      #code
    rescue => e
      Rails.logger.error { "Encountered an error during <details>; More info: #{e.message} #{e.backtrace.join("\n")}"}
    end
  end

  def destroy
  end

  private

  def set_comment
    @c = Comment.find(params[:id])
  end
end
