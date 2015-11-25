class AddPageContentType < ActiveRecord::Migration
  def change
    add_column :page_contents, :content_type, :integer, null: false, default: 0
  end
end
