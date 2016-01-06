class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :title
      t.string :title_en

    end

    add_reference :users, :hotel
    add_foreign_key :users, :hotels
  end
end
