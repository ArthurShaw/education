class AddFieldsToScheduleEvents < ActiveRecord::Migration
  def change
    add_column :schedule_events, :name, :string
    add_column :schedule_events, :name_en, :string
    add_column :schedule_events, :speaker, :string
    add_column :schedule_events, :speaker_en, :string
  end
end
