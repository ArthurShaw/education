class Event < ActiveRecord::Base

  enum type: [:workshop, :other]

  belongs_to :workshop
  has_and_belongs_to_many :sections
end
