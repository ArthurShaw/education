class AddEnAttributes < ActiveRecord::Migration
  def change
    change_table :sections do |t|
      t.string :title_en
    end

    change_table :special_guests do |t|
      t.string :first_name_en
      t.string :last_name_en
      t.string :middle_name_en
      t.text :about_en

    end
  end
end
