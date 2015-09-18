Game.destroy_all

10.times do |i|
  Game.create!(initiator_id: "initiator#{i}",
               challenger_id: "challenger#{i}",
               name: "Game #{i}",
               state: Game::STATES[i % 3]
  )
end
