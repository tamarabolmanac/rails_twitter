class RelationshipsController < ApplicationController
  def follow_user
  	@user_to_follow = User.find(params[:id])
  	@current = User.find(current_user.id)
  	@current.follow(params[:id])
    UserMailer.new_follower(@user_to_follow, @current).deliver_now!
    redirect_to @user_to_follow
  end

  def unfollow_user
  	@user_to_unfollow = User.find(params[:id])
  	@current = User.find(current_user.id)
  	@current.unfollow(params[:id])
    redirect_to @user_to_unfollow
  end
end
