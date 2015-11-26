class Workshop < ActiveRecord::Base
  belongs_to :user
  belongs_to :special_guest
  belongs_to :section
  validates :title, :description, presence: true

  enum status: [:waiting_confirmation, :confirmed, :denied]


  def has_author?
    user || special_guest
  end

end
