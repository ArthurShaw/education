class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title, null: false
    end
  end
end
