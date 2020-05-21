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
    assert_instance_of Player, @battleship.computer_player
    assert_instance_of Player, @battleship.human_player
    assert_instance_of Turn, @battleship.game_turn
    assert_equal false, @battleship.computer_player == @battleship.human_player
  end
end
