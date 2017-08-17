class AddVenueToSetlist < ActiveRecord::Migration[5.0]
  def change
  	add_column :setlists, :venue, :string
  end
end
