class Shout < ActiveRecord::Base
  DASHBOARD_TYPES = [
    TextShout,
    PhotoShout,
  ]

  CONTENT_TYPES = DASHBOARD_TYPES

  default_scope { order(created_at: :desc) }

  belongs_to :user
  belongs_to :content, polymorphic: true

  delegate :username, to: :user

  # This is the problem
  def self.reshouts_for(shout)
    where(content_type: "Reshout", id: shout.id)
  end

  def self.dashboard_types
    where(content_type: DASHBOARD_TYPES)
  end

  def new_reshout
    Reshout.new(shout: self)
  end
end
