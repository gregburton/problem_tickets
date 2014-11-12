class Photo < ActiveRecord::Base
  has_attached_file :image, :styles => {:large => "640x480>",
                                        :medium => "480x320>",
                                        :thumb => "200x200#"}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
