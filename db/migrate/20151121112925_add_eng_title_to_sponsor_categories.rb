class AddEngTitleToSponsorCategories < ActiveRecord::Migration
  def change
    add_column :sponsor_categories, :name_en, :string, null: false, default: ""
  end
end
