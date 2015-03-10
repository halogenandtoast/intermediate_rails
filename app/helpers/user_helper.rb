module UserHelper
  def follow_button(user)
    if current_user.following?(user)
      button_to "Unfollow", unfollow_user_path(user), method: :delete
    elsif current_user.can_follow?(user)
      button_to "Follow", follow_user_path(user)
    end
  end
end
