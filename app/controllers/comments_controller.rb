class CommentsController < ApplicationController

  def index
    comments = Comment.all
    render json: comments.as_json
  end
end
