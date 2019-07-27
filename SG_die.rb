#Die class file created in lesson 13
class Die
  attr_reader :number

  def initialize (low=1, high=6)
    @low = low
    @high = high
    roll
  end

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
end
