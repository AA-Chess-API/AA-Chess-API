# == Schema Information
#
# Table name: games
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  initiator_id  :string
#  challenger_id :string
#  game_log      :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  state         :string           default("WAITING"), not null
#  last_move     :string
#  last_player   :string
#

class Game < ActiveRecord::Base
  STATES = %w(WAITING, PLAYING, FINISHED)

  validates :initiator_id, :name, presence: true

  def self.eligible_games
    all.
    where("state != 'FINISHED'").
    select(:id, :name, :initiator_id, :challenger_id, :state)
  end

  def set_challenger(challenger_id)
    self.challenger_id = challenger_id
    self.last_player = [challenger_id, initiator_id].sample
    save!
  end

  def confirm_move_of(player, move)
    if last_player == player
      "404"
    else
      self.last_player = player
      self.last_move = move
      save!
      "202"
    end
  end

  def get_state_for(player)
    if last_player == player
      { state: "WAIT" }
    else
      { state: "GO", move: last_move }
    end
  end
end
