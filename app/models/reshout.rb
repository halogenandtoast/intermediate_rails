class Reshout < ActiveRecord::Base
  has_one :parent, class_name: "Shout", as: :content
  belongs_to :shout

  def self.for_shout(shout)
    where(shout_id: shout.id)
  end

  def index_content
    nil
  end
end
