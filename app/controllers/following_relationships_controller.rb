class FollowingRelationshipsController < ApplicationController
  def create
    user = find_user
    current_user.follow(user)
    redirect_to user
  end

  def destroy
    user = find_user
    current_user.unfollow(user)
    redirect_to user
  end

  private

  def find_user
    User.find(params[:id])
  end
end
