class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.string :description
      t.string :type
      t.date :date
      t.time :from
      t.time :to
    end
  end
end
