class User < ActiveRecord::Base
  has_many :shouts

  has_many :followed_user_relationships,
    foreign_key: :follower_id,
    class_name: "FollowingRelationship"
  has_many :followed_users,
    through: :followed_user_relationships

  has_many :follower_relationships,
    foreign_key: :followed_user_id,
    class_name: "FollowingRelationship"
  has_many :followers,
    through: :follower_relationships

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def follow(user)
    followed_users << user
  end

  def unfollow(user)
    followed_users.destroy(user)
  end

  def can_follow?(user)
    user.id != id
  end

  def following?(user)
    followed_users.where(id: user.id).exists?
  end

  def reshouted?(shout)
    shouts.where(content_type: "ReShout", id: shout.id).exists?
  end

  def owns?(object)
    object.user_id == id
  end
end
