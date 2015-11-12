class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null:false
      t.text :text
      t.belongs_to :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
