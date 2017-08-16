class AddArtistPhotoToSetlist < ActiveRecord::Migration[5.0]
  def change
  	add_column :setlists, :artist_photo, :string
  end
end
