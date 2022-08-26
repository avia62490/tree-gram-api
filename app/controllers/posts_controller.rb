class PostsController < ApplicationController
  def index
    posts = Post.all
    render json: posts.as_json
  end
end
