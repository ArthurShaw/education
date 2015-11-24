class AddFkWorkshops < ActiveRecord::Migration
  def change

    add_reference :workshops, :special_guest
    add_foreign_key :workshops, :special_guests

  end
end
