class AddFieldsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :title_en, :string, null: false, default: ''
    add_column :events, :description_en, :string, null: false, default: ''

    add_reference :events, :workshop

    create_table :events_sections, :id => false do |t|
      t.references :event
      t.references :section
    end

    remove_column :events, :type, :string
  end
end
