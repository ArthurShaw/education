class AddAttributesToSpeakers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :work_place
      t.string :occupation


    end
  end
end
