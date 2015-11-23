class Workshop < ActiveRecord::Base
  belongs_to :user
  belongs_to :section
  validates :title, :description, presence: true

  enum status: [:waiting_confirmation, :confirmed, :denied]
  # has_attached_file :document
  # validates_attachment :document, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
end
