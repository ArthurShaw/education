class AddParamsToUsersAndListeners < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.date :arrival
      t.date :departure
      t.boolean :hotel

    end

    change_table :listener_requests do |t|
      t.date :arrival
      t.date :departure
      t.boolean :hotel

    end
  end
end
