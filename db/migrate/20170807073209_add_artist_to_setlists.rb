class AddArtistToSetlists < ActiveRecord::Migration[5.0]
  def change
  	add_column :setlists, :artist, :string
  end
end
