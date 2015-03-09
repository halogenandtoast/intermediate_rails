class Shout < ActiveRecord::Base
  default_scope { order(created_at: :desc) }

  belongs_to :user
  belongs_to :content, polymorphic: true

  delegate :username, to: :user
end
