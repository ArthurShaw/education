class Workshop < ActiveRecord::Base
  belong_to :user
  validates :title, :description, presence: true
  has_attached_file :document
  validates_attachment :document, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
end
