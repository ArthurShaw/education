class ScheduleInterval < ActiveRecord::Base
  belongs_to :section
  belongs_to :workshop
end
