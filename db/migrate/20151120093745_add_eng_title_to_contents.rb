class AddEngTitleToContents < ActiveRecord::Migration
  def change
   add_column :page_contents, :name_en, :string, null: false, default: ""
  end
end
