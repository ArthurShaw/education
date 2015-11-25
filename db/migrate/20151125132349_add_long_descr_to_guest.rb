class AddLongDescrToGuest < ActiveRecord::Migration
  def change
    add_column :special_guests, :about_long, :text, null: false, default: ''
    add_column :special_guests, :about_long_en, :text, null: false, default: ''
  end
end
