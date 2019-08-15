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

  def load_players(from_file)
    File.readlines(from_file).each do |line|
      add_player(Player.from_csv(line))
    end
  end

  def high_score_entry(player)
    formatted_name = player.name.ljust(20, '.')
    "#{formatted_name} #{player.score}"
  end

  def save_high_scores(to_file="high_scores.txt")
    File.open(to_file, "w") do |file|
      file.puts "#{@title.capitalize} High Scores:"
        @players.sort.each do |player|
         file.puts high_score_entry(player)
      end
    end
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
  end

  def player_stats
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

    puts "\n#{total_points} total points from treasures found"

    puts "\n#{@title.capitalize} High Scores:"
    @players.sort.each do |player|
       puts high_score_entry(player)
    end
  end
end
