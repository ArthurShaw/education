class CreateScheduleIntervals < ActiveRecord::Migration
  def change
    create_table :schedule_intervals do |t|
      t.string :title, null: false
      t.string :title_en, null: false
      t.string :description
      t.string :description_en
      t.date :date
      t.time :from
      t.time :to
      t.references :workshop
      t.references :section
    end
  end
end
