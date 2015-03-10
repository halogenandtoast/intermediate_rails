class Dashboard
  def initialize(user)
    @user = user
  end

  def feed(feed_class = Feed)
    scope = Shout.without_reshouts_for(user)
    feed_class.new(feed_ids, scope)
  end

  private
  attr_reader :user

  def feed_ids
    user.followed_user_ids + [user.id]
  end
end
