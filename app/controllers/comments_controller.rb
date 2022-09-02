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

  def update
    comment = Comment.find_by(id: params[:id])
    comment.body = params[:body]
    comment.save
    render json: comment.as_json
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    comment.destroy
    render json: {message: "Comment has been removed"}
  end
end
