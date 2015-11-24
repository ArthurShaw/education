class AddFkEvents < ActiveRecord::Migration
  def change
    add_foreign_key :events, :workshops

  end
end
