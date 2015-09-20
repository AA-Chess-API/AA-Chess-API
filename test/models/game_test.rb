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

require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
