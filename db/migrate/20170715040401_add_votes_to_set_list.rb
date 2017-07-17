class AddVotesToSetList < ActiveRecord::Migration[5.0]
  def change
    add_column :setlists, :votes, :integer
  end
end
