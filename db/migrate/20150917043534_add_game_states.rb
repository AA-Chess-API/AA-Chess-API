class AddGameStates < ActiveRecord::Migration
  def change
    add_column :games, :state, :string, default: "WAITING",null: false
  end
end
