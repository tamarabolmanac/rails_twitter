class RelationshipsController < ApplicationController
  def follow_user
  	@user_to_follow = User.find(params[:id])
  	@current = User.find(current_user.id)
  	@current.follow(params[:id])
  end

  def unfollow_user
  	@user_to_unfollow = User.find(params[:id])
  	@current = User.find(current_user.id)
  	@current.unfollow(params[:id])
  end
end
