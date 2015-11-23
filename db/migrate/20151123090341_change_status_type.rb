class ChangeStatusType < ActiveRecord::Migration
  def change
    remove_column :workshops, :status
    add_column :workshops, :status, :integer, null: false, default: 0
  end
end
