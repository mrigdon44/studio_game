#Die class file created in lesson 13
class Die
  attr_reader :number

  def initialize (low=1, high=6)
    @low = low
    @high = high
    roll
  end
# used parameters with default values in creating the die class.  This allowed extend for
# effectivly changing the size of the die to be rolled.
  def roll
    @number = rand(@low..@high)
    #puts "the number rolled was #{number_rolled}"
  end
end

if __FILE__== $0
die1 = Die.new
puts die1.number
die1.roll
puts die1.number
die1 = Die.new(7, 25)
puts die1.number
die1.roll
puts die1.number
end
