class AddAlbumToTracks < ActiveRecord::Migration[5.0]
  def change
  	add_column :tracks, :album, :string
  end
end
