require_relative 'SG_player'
require_relative 'SG_gameturn'
require_relative 'SG_treasuretrove'

class Game
  attr_reader :title

  def initialize (title)
    @title = title
    @players = []
  end

  def add_player (player)
    @players << player
  end

  def total_points
    @players.reduce(0) { |sum, player| sum + player.points }
  end

  def play (rounds)
    puts "\n"
    puts "Welcome to #{@title.capitalize}! There are #{@players.size} players in the game."

    @players.each do |player|
      puts player
    end

    treasures = TreasureTrove::TREASURES

    puts "\nThere are #{treasures.size} items in the treasure trove:"

    treasures.each do |treasure|
      puts "A #{treasure.name}, worth #{treasure.points} points"
    end

    1.upto(rounds) do |count|
      puts "\nRound #{count}:"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end
  puts "\n"

  def player_stats
    def self.print_stats(player)
      strong, wimpy = @players.partition {|player| player.strong?}

      puts "#{@title.capitalize} statistics:"

      puts "\n#{strong.size} strong players:"
      strong.each do |player|
        puts "#{player.name} #{player.health}"
      end

      puts "\n#{wimpy.size} wimpy players:"
      wimpy.each do |player|
        puts "#{player.name} #{player.health}"
      end

      @players.sort.each do |player|
        puts "\n#{player.name}'s point totals:"
        player.each_found_treasure do |treasure|
          puts "#{treasure.points} total #{treasure.name} points"
        end
        puts "#{player.points} grand total points"
      end
    end

    puts "\n#{total_points} total points from treasures found"

    puts "\n#{@title.capitalize} High Scores:"
    @players.sort.each do |player|
      formated_name = player.name.ljust(20, '.')
      puts "#{formated_name}#{player.score}"
    end
  end
end
end
