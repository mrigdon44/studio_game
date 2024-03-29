#Lesson 14 made a module file called gameturn.  At this point using modules as
#a bucket of methods.  Module method were interesting, basically allowed you to
#redifine self

require_relative 'SG_die'
require_relative 'SG_player'

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
  end
end
