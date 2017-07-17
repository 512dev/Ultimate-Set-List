class CreateSetListTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :set_list_tracks do |t|
      t.references :track, foreign_key: true
      t.references :setlist, foreign_key: true

      t.timestamps
    end
  end
end
