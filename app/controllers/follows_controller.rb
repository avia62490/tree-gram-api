class FollowsController < ApplicationController
  before_action :authenticate_user
  
  def create
    follow = Follow.new(
      follower_id: current_user.id,
      followed_user_id: params[:followed_user_id]
    )
    if follow.followed_user_id == current_user.id
      render json: {message: "not allowed to follow self"}
    else
      follow.save
      render json: follow.as_json
    end
  end

  def destroy
    follow = Follow.find_by(id: params[:id])
    follow.destroy
    render json: {message: "You are no longer following this"}
  end
end
