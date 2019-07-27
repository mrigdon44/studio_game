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

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)
player4 = Player.new("shemp", 90)

players = [player1, player2, player3]

players.pop
players.push(player4)

puts "\n"

puts "There are #{players.size} in the game:"

players.each do |player|
  puts player
end

puts "\n"

players.each do |player|
  puts player.health
end

puts "\n"

players.each do |player|
  player.woot
  player.blam
  player.woot
  puts player
  puts "\n"
end
