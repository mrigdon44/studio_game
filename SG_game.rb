require_relative 'SG_player'
require_relative 'SG_gameturn.rb'

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
    @player.each do |player|
    puts player
  end

    @player.each do |player|
      puts "\n"
      GameTurn.take_turn(player)
    puts player
  end
  puts "\n"
  end
end
