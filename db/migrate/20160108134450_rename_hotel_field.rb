class RenameHotelField < ActiveRecord::Migration
  def change
    rename_column :users, :hotel, :need_hotel
    rename_column :listener_requests, :hotel, :need_hotel
  end
end
