class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.string :title
      t.references :setlist, foreign_key: true
      t.string :album
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
