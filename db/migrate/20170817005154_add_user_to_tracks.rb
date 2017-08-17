class AddUserToTracks < ActiveRecord::Migration[5.0]
  def change
  	  	add_column :tracks, :user, :string
  end
end
