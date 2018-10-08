class CommentsController < ApplicationController
    before_action :require_logged_in
  
    def new
      @comment = Comment.new
    end
  
    def create
      @comment = Comment.new(comment_params)
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
  