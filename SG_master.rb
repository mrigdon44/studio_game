require_relative 'SG_game'

game1 = Game.new("knuckleheads")
game1.load_players(ARGV.shift || "players.csv")
# game1.add_player(player1)
# game1.add_player(player2)
# game1.add_player(player3)
# game1.add_player(player4)

loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    game1.play(answer.to_i)
  when 'quit', 'exit'
    game1.player_stats
    game1.save_high_scores
    break
  else
    puts "Please enter a number or 'quit'"
  end
end
