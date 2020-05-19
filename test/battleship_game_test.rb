require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require './lib/battleship_game'

class BoardTest < Minitest::Test
  def setup
    @user = Player.new
    @computer = Player.new
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @game = Battleship.new
  end

  def test_it_exists
    assert_instance_of Battleship, @game
  end

  def test_it_can_start_game
    @game.start
    assert_equal
  end

  def test_it_computer_can_place_ship


  end
end
