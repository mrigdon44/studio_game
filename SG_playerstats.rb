require_relative 'SG_player'
require_relative 'SG_game'

module PlayerStats
  ?players = players
  def self.print_stats(player)
    strong, wimpy = players.partition {|player| player.strong?}

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
end

if __FILE__== $0
  player1 = Player.new("moe")
  player2 = Player.new("larry", 60)
  PlayerStats.print_stats(player1)
end
