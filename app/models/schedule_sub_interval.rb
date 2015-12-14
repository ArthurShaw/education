class ScheduleSubInterval < ActiveRecord::Base
  belongs_to :schedule_interval
  has_many :schedule_events
end
