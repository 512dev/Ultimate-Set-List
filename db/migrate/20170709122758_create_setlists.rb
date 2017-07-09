class CreateSetlists < ActiveRecord::Migration[5.0]
  def change
    create_table :setlists do |t|
      t.string :name
      t.references :venue, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
