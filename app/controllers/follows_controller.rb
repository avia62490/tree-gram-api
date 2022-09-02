class FollowsController < ApplicationController
  before_action :authenticate_user, only: [:create]
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
end
