class AddUrlAndPictureToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :url, :string, null: false, default: ''
    add_attachment :sponsors, :image
  end
end
