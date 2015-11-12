class AddUserFields < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :country
      t.string :city
      t.string :degree
      t.string :phone
      t.text :biography
      t.text :speech_experience

    end
  end
end
