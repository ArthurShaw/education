class CreateScheduleEvents < ActiveRecord::Migration
  def change
    create_table :schedule_events do |t|
      t.references :schedule_sub_interval
      t.references :workshop
      t.string :title, null: false
      t.string :title_en, null: false
    end
  end
end
