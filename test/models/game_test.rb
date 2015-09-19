# == Schema Information
#
# Table name: games
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  initiator_id  :integer
#  challenger_id :integer
#  record        :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
