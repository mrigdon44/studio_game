class Player
  attr_reader :health
  attr_accessor :name

  def initialize (name, health=100)
    @name = name.capitalize
    @health = health
  end

def score
  @health + @name.length
end

def to_s
  "I'm #{@name} with a health of #{@health} and a score of #{score}"
end

def blam
  @health -= 10
  puts "#{@name} got Blammed!!!"
end

def woot
  @health += 15
  puts "#{@name} got w00ted!!!"
end
end

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
    puts "Welcome to #{@title.capitalize}! There are #{@player.size} players in the game."
    puts @player
    @player.each do |player|
    player.woot
    player.blam
    player.blam
    puts player
  end
  end
end

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)
player4 = Player.new("shemp", 90)

game1 = Game.new("knucklehheads")
game1.add_player(player1)
game1.add_player(player2)
game1.add_player(player3)

puts game1.title

game1.play
