class CreateScheduleSubIntervals < ActiveRecord::Migration
  def change
    create_table :schedule_sub_intervals do |t|
      t.time :from
      t.time :to
      t.references :schedule_interval
    end
  end
end
