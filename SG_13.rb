#In lesson 13, made no changes to master files, but did a game spec file, and used
#test driven design (TDD) to add conditionals to game class file.  Conditionals allowed extend for
#randomness to be added to the game. 

require_relative 'SG_game'

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)
player4 = Player.new("shemp", 90)

game1 = Game.new("knucklehheads")
game1.add_player(player1)
game1.add_player(player2)
game1.add_player(player3)
game1.add_player(player4)

game1.play
