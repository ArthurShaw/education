class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name
      t.belongs_to :sponsor_category, foreign_key: true
    end
  end
end
