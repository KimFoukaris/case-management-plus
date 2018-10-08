class CommentsController < ApplicationController
    before_action :require_logged_in
  
    def new
      @comment = Comment.new(update_id: params[:update_id], user_id: session[:user_id])
    end
  
    def create
      @comment = Comment.create(comment_params)
      render json: @comment, status: 201
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(
        :update_id,
        :user_id,
        :description,
        :created_at
      )
    end
  
  end
  