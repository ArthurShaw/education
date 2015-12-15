class AddVisibleToSpecialGuests < ActiveRecord::Migration
  def change
    add_column :special_guests, :visible, :boolean, null: false, default: false
  end
end
