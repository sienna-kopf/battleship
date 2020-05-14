require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_a_board_has_cells
    assert_equal 16, @board.cells.count
    assert_equal Cell, @board.cells['A1'].class
  end

end
