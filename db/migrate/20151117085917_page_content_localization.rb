class PageContentLocalization < ActiveRecord::Migration
  def change
    add_column :page_contents, :content_en, :text, null: false, default: ""
  end
end
