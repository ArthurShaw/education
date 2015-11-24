class Event < ActiveRecord::Base

  enum type: [:workshop, :other]

  belongs_to :workshop
  belongs_to :section
end
