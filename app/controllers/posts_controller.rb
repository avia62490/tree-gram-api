class PostsController < ApplicationController
  before_action :authenticate_user, only: [:create, :update]

  def index
    posts = Post.all
    # render json: posts.as_json
    posts_coordinates = []
    posts.each do |post|
      posts_coordinates << { type: "Feature", properties: { id: post.id, user_id: post.user_id, user_name: post.user.name, image: post.image_url, likes: post.likes }, geometry: { type: "Point", coordinates: [ post.longitude, post.latitude, 0.0 ] } }
    end
    render json: {
      type: "FeatureCollection",
      crs: { type: "name", properties: { name: "urn:ogc:def:crs:OGC:1.3:CRS84" } },
      features: posts_coordinates
      }
  end

  def show
    post = Post.find_by(id: params[:id])
    render json: post.as_json
  end

  def create
    response = Cloudinary::Uploader.upload(params[:image], resource_type: :auto)
    cloudinary_url = response["secure_url"]
    p cloudinary_url
    post = Post.new(
      image_url: cloudinary_url,
      description: params[:description],
      latitude: params[:latitude],
      longitude: params[:longitude],
      user_id: current_user.id 
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
