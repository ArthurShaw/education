class Section < ActiveRecord::Base
  has_many :workshops
  has_and_belongs_to_many :events
end
