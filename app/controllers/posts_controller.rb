class PostsController < ApplicationController
  before_action :authenticate_user, only: [:create, :update]
  def index
    posts = Post.all
    render json: posts.as_json
  end

  def create
    post = Post.new(
      image_url: params[:image_url],
      description: params[:description],
      latitude: params[:latitude],
      longitude: params[:longitude],
      user_id: params[:user_id]
    )
    post.save
    render json: post.as_json
  end
end
