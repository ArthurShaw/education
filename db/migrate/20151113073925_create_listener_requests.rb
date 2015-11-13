class CreateListenerRequests < ActiveRecord::Migration
  def change
    create_table :listener_requests do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :email
      t.string :country
      t.string :city
      t.string :phone

      t.timestamps null: false
    end
  end
end
