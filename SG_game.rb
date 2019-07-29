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

  def play (rounds)
    puts "\n"
    puts "Welcome to #{@title.capitalize}! There are #{@player.size} players in the game."

    @player.each do |player|
      puts player
    end

    1.upto(rounds) do |count|
      puts "\nRound #{count}:"
    @player.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end
  puts "\n"

  def player_stats
    strong, wimpy = @player.partition {|player| player.strong?}

    puts "#{@title.capitalize} statistics:"

    puts "\n#{strong.size} strong players:"
    strong.each do |player|
      puts "#{player.name} #{player.health}"
    end

    puts "\n#{wimpy.size} wimpy players:"
    wimpy.each do |player|
      puts "#{player.name} #{player.health}"
    end

    puts "\n#{@title} High Scores:"
    @player.sort.each do |player|
      formated_name = player.name.ljust(20, '.')
      puts "#{formated_name}#{player.score}"
    end
  end
end
end
