require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @turn = Turn.new
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_attributes
    assert_instance_of Board, @turn.computer_board
    assert_instance_of Board, @turn.player_board
    assert_instance_of Ship, @turn.cruiser_comp
    assert_instance_of Ship, @turn.submarine_comp
    assert_instance_of Ship, @turn.cruiser_play
    assert_instance_of Ship, @turn.submarine_comp
    assert_equal false, @turn.player_board == @turn.computer_board
    assert_equal false, @turn.cruiser_comp == @turn.cruiser_play
    assert_equal false, @turn.submarine_comp == @turn.submarine_play
  end


  def test_it_selects_a_new_random_cell
    random_1 = @turn.select_random_cell
    random_2 = @turn.select_random_cell

    assert_equal false, random_1 == random_2
  end

  def test_computer_shoots_only_new_coords
    @turn.computer_shot
    @turn.computer_shot
    @turn.computer_shot
    @turn.computer_shot
    @turn.computer_shot
    @turn.computer_shot
    @turn.computer_shot
    @turn.computer_shot
    @turn.computer_shot
    @turn.computer_shot
  end
end
