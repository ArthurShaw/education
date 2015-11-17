class AddAttributesToWorkshops < ActiveRecord::Migration
  def change
    change_table :workshops do |t|
      t.string :status
      t.references :section, foreign_key: true

    end
  end
end
