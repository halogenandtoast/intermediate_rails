class Shout < ActiveRecord::Base
  DASHBOARD_TYPES = [
    TextShout,
    PhotoShout,
  ]

  CONTENT_TYPES = DASHBOARD_TYPES

  default_scope { order(created_at: :desc) }

  belongs_to :user
  belongs_to :content, polymorphic: true, dependent: :destroy

  delegate :username, to: :user

  def self.reshouts
    where(content_type: "Reshout")
  end

  def self.without_reshouts_for(user)
    where("NOT (content_type = 'Reshout' AND user_id = #{user.id})")
  end

  def self.reshouts_for(shout)
    reshouts.joins("INNER JOIN reshouts ON reshouts.shout_id = #{shout.id}")
  end

  def self.dashboard_types
    where(content_type: DASHBOARD_TYPES)
  end

  def new_reshout
    Reshout.new(shout: self)
  end

  def reshouts
    self.class.reshouts_for(self)
  end
end
