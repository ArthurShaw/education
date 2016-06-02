class Item < ActiveRecord::Base
  has_attached_file :picture, styles: {medium: "400x400>", thumb: "100x100>"}, default_url: 'noavatar.png'
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  has_one :slider
end
