module ApplicationHelper
  def follow_button(user)
    if current_user.following?(user)
      button_to "Unfollow", unfollow_user_path(user), method: :delete
    elsif current_user.can_follow?(user)
      button_to "Follow", follow_user_path(user)
    end
  end

  def shout_form_for(content_class)
    form_for(Shout.new(content_type: content_class)) do |form|
      form.fields_for(:content) do |content_form|
        yield content_form
      end +
        form.hidden_field(:content_type) +
        form.submit("Shout")
    end
  end
end
