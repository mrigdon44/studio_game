require_relative 'SG_player'
require_relative 'SG_die.rb'

class Game
  attr_reader :title

  def initialize (title)
    @title = title
    @player = []
  end

  def add_player (player)
    @player << player
  end

  def play
    puts "\n"
    puts "Welcome to #{@title.capitalize}! There are #{@player.size} players in the game."
    puts @player
    @player.each do |player|
      puts "\n"
      die = Die.new
      case die.roll
      when 1..2
        player.blam
      when 3..4
        puts "#{player.name} is skipped"
      else
        player.woot
      end
    puts player
  end
  puts "\n"
  end
end
