require_relative 'SG_die'
require_relative 'SG_player'
require_relative 'SG_treasuretrove'

module GameTurn
  def self.take_turn(player)
    die = Die.new
    case die.roll
    when 1..2
      player.blam
    when 3..4
      puts "#{player.name} is skipped"
    else
      player.woot
    end
    treasure = TreasureTrove.random
    player.found_treasure(treasure)
  end
end
