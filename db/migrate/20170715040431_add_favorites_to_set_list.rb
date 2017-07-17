class AddFavoritesToSetList < ActiveRecord::Migration[5.0]
  def change
    add_column :setlists, :favorites, :string
  end
end
