class AddUserToStreetArt < ActiveRecord::Migration[5.1]
  def change
    add_reference :street_arts, :user, foreign_key: true
  end
end
