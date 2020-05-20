require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/turn'
require './lib/player'

class TurnTest < Minitest::Test
  def setup
    @turn = Turn.new
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_players
    assert_instance_of Player, @turn.human_player
    assert_instance_of Player, @turn.computer_player
  end

  def test_it_selects_a_new_random_cell
    random_1 = @turn.select_random_cell
    random_2 = @turn.select_random_cell

    assert_equal false, random_1 == random_2
  end
end
