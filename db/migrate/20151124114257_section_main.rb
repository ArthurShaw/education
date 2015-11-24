class SectionMain < ActiveRecord::Migration
  def change
    add_column :sections, :is_main, :boolean, null: false, :default => false
  end
end
