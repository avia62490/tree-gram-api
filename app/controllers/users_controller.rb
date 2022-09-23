class UsersController < ApplicationController

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    posts = Post.where(user_id: params[:id])
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
  
end
