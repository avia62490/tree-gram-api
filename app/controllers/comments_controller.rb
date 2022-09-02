class CommentsController < ApplicationController

  def index
    comments = Comment.all
    render json: comments.as_json
  end

  def create
    comment = Comment.new(
      body: params[:body],
      post_id: params[:post_id],
      user_id: params[:user_id]
    )
    comment.save
    render json: comment.as_json
  end
end
