class PhotoShout < ActiveRecord::Base
  has_attached_file :photo
  validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end
