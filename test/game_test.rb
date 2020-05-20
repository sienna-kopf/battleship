require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/turn'
require './lib/player'

class GameTest < Minitest::Test
  def setup
    @battleship = Game.new
  end

  def test_it_exists
    assert_instance_of Game, @battleship
  end

  def test_it_is_setup_with_players_and_turn

  end


  def test_it_runs
    # @battleship.valid_coordinate_format?(['A1', 'A2', 'A*'])
    @battleship.setup
    @battleship.start
  end

end
