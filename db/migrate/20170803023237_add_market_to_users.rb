class AddMarketToUsers < ActiveRecord::Migration[5.0]
 def change
    add_column :users, :market, :string
  end
end
