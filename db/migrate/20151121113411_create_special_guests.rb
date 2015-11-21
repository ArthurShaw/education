class CreateSpecialGuests < ActiveRecord::Migration
  def change
    create_table :special_guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.text :about
      t.attachment :avatar

      t.timestamps null: false
    end
  end
end
