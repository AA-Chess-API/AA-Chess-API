class AddStagedMoveToGame < ActiveRecord::Migration
  def change
    add_column :games, :staged_move, :string
  end
end
