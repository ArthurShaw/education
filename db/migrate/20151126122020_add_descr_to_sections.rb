class AddDescrToSections < ActiveRecord::Migration
  def change
    add_column :sections, :description, :text, null: false, default: ''
    add_column :sections, :description_en, :text, null: false, default: ''

  end
end
