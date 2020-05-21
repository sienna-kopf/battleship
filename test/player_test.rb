require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/turn'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_it_exists
    player = Player.new
    assert_instance_of Player, player
  end

  def test_it_has_a_board_and_ships
    player = Player.new

    assert_instance_of Board, player.board
    assert_instance_of Ship, player.cruiser
    assert_instance_of Ship, player.submarine
  end

  def test_two_diff_players_have_different_boards_and_ships
    human_player = Player.new
    computer_player = Player.new

    assert_equal false, human_player.board == computer_player.board
    assert_equal false, human_player.cruiser == computer_player.cruiser
    assert_equal false, human_player.submarine == computer_player.submarine
  end
end
