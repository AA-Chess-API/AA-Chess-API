class ChangeGameUsersToString < ActiveRecord::Migration
  def change
    change_column :games, :initiator_id, :string
    change_column :games, :challenger_id, :string
  end
end
