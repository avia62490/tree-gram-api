class PostsController < ApplicationController
  before_action :authenticate_user, only: [:create, :update]

  def index
    posts = Post.all
    render json: posts.as_json
  end

  def show
    post = Post.find_by(id: params[:id])
    render json: post.as_json
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

  def update
    post = Post.find_by(id: params[:id])
    post.image_url = params[:image_url] || post.image_url
    post.description = params[:description] || post.description
    post.latitude = params[:latitude] || post.latitude
    post.longitude = params[:longitude] || post.longitude
    post.save
    render json: post.as_json
  end

  def destroy
    post = Post.find_by(id: params[:id])
    post.destroy
    render json: {message: "Post has been deleted"}
  end

end
