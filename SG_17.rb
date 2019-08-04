#created a hash for the treasures and used it to track the points that players received for 
#finding treasures

class Player
  attr_reader :health
  attr_accessor :name

  def initialize (name, health=100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

def found_treasure(treasure)
  @found_treasures[treasure.name] += treasure.points
  puts "#{@name} found a #{treasure.name} worth #{treasure.points} points"
  puts "#{@name}'s treasures: #{@found_treasures}'"
end

def points
  @found_treasures.values.reduce(0, :+)
end

def score
  @health + points
end

def <=> (other)
  other.score <=> score
end

def to_s
  "I'm #{@name} with a health of #{@health}, with points of #{points}, and a score of #{score}"
end

def blam
  @health -= 10
  puts "#{@name} got Blammed!!!"
end

def woot
  @health += 15
  puts "#{@name} got w00ted!!!"
end

def strong?
  @health > 100
end
end


if __FILE__== $0
player = Player.new("moe")
puts player
puts player.name
puts player.health
player.woot
puts player.health
player.blam
puts player.health
end
