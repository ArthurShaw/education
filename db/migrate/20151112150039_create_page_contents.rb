class CreatePageContents < ActiveRecord::Migration
  def change
    create_table :page_contents do |t|
      t.string :name, null: false, default: ""
      t.text :content, null: false, default: ""
      t.timestamps null: false
    end
  end
end
