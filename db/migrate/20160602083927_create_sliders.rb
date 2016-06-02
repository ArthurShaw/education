class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.belongs_to :item

      t.timestamps null: false
    end
  end
end
