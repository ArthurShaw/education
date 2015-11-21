class AddVisibleCheckboxToContents < ActiveRecord::Migration
  def change
    add_column :page_contents, :hidden, :boolean, null: false, default: false
  end
end
