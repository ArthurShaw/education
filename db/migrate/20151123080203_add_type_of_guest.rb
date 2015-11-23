class AddTypeOfGuest < ActiveRecord::Migration
  def change
    add_column :special_guests, :guest_type, :integer, :null => false, :default => 0
  end
end
