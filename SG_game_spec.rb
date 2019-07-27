#created in lesson 13 on conditionals
require_relative 'SG_game'


describe Game do

  before do
    @game = Game.new("knucklehheads")

    @initial_health = 100
    @player = Player.new("Moe", @initial_health)

    @game.add_player(@player)
  end

    it "woots the player if a high number is rolled" do
      Die.any_instance.stub(:roll).and_return(5)
      @game.play
      @player.health.should == @initial_health + 15
    end

    it "does not change the players health" do
      Die.any_instance.stub(:roll).and_return(3)
      @game.play
      @player.health.should == @initial_health
    end

    it "Blams the player if a low number is rolled" do
      Die.any_instance.stub(:roll).and_return(1)
      @game.play
      @player.health.should == @initial_health - 10
    end
end
