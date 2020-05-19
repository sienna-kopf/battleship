require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/battleship_game'

class Player < Minitest::Test

  def test_it_exists
    @user = Player.new
    @computer = Player.new
    assert_instance_of Player, @user
    assert_instance_of Player, @computer
  end
end
