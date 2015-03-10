class Reshout < ActiveRecord::Base
  has_one :parent, class_name: "Shout", as: :content
  belongs_to :shout

  def index_content
    nil
  end
end
