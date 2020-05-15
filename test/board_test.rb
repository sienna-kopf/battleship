require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_a_board_has_cells
    assert_equal 16, @board.cells.count
    assert_equal Cell, @board.cells['A1'].class
  end

  def test_if_a_coordinate_is_valid
    assert_equal true, @board.valid_coordinate?('A1')
    assert_equal true, @board.valid_coordinate?('D4')
    assert_equal false, @board.valid_coordinate?('A5')
    assert_equal false, @board.valid_coordinate?('E1')
    assert_equal false, @board.valid_coordinate?('A22')
  end

  def test_ship_length_doesnt_match_given_coordinates_for_valid_ship_placement
    assert_equal false, @board.valid_placement?(@cruiser, ['A1', 'A2'])
    assert_equal false, @board.valid_placement?(@submarine, ['A2', 'A3', 'A4'])
  end

  def test_non_consecutive_coordinates_for_valid_ship_placement
    assert_equal false, @board.valid_placement?(@cruiser, ['A1', 'A2', 'A4'])
    assert_equal false, @board.valid_placement?(@submarine, ['A1', 'C1'])
    assert_equal false, @board.valid_placement?(@cruiser, ['A3', 'A2', 'A1'])
    assert_equal false, @board.valid_placement?(@submarine, ['C1', 'B1'])
  end

  def test_diagonal_coordinates_for_valid_ship_placement
    assert_equal false, @board.valid_placement?(@cruiser, ['A1', 'B2', 'C3'])
    assert_equal false, @board.valid_placement?(@submarine, ['C2', 'D3'])
  end

  def test_valid_placement_options
    assert_equal true, @board.valid_placement?(@submarine, ['A1', 'A2'])
    assert_equal true, @board.valid_placement?(@cruiser, ['B1', 'C1', 'D1'])
  end

end
