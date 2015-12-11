class ScheduleInterval < ActiveRecord::Base
  belongs_to :section
  belongs_to :workshop

  has_many :schedule_sub_intervals
end
