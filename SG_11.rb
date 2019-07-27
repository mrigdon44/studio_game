require_relative 'game'

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)
player4 = Player.new("shemp", 90)

game1 = Game.new("knucklehheads")
game1.add_player(player1)
game1.add_player(player2)
game1.add_player(player3)

game1.play
