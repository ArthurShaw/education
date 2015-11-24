class AddEnWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :title_en, :string, null: false, default: ''
    add_column :workshops, :description_en, :text, null: false, default: ''
  end
end
