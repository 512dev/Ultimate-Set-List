class AddSetlistToTracks < ActiveRecord::Migration[5.0]
  def change
  	add_column :tracks, :setlist, :string
  end
end
