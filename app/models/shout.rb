class Shout < ActiveRecord::Base
  CONTENT_TYPES = [
    TextShout,
    PhotoShout,
  ]

  default_scope { order(created_at: :desc) }

  belongs_to :user
  belongs_to :content, polymorphic: true

  delegate :username, to: :user
end
