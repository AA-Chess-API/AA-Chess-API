class AddInfoToGames < ActiveRecord::Migration
  def change
    rename_column :games, :staged_move, :last_move
    add_column :games, :last_player, :string
  end
end
