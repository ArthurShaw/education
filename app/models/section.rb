class Section < ActiveRecord::Base
  has_many :workshops
  has_many :events
end
