class SpecialGuest < ActiveRecord::Base
  validates :first_name, :last_name, presence: true

  enum guest_type: [:guest, :speaker]

  has_many :workshops, :dependent => :delete_all

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "noavatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def readable_name
    "#{first_name} #{last_name}"
  end
end
