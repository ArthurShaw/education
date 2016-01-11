class AddAttributesToListeners < ActiveRecord::Migration
  def change
    change_table :listener_requests do |t|
      t.string :work_place
      t.string :occupation
      t.references :hotel, foreign_key: true
    end
  end
end
