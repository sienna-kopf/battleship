require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
  end

  def test_it_exists
      assert_instance_of Board, @board
  end

  def test_it_if_has_a_valid_coordinate
    assert_equal true, @board.valid_coordinate?('A1')
    assert_equal true, @board.valid_coordinate?('D4')
    assert_equal false, @board.valid_coordinate?('A5')
    assert_equal false, @board.valid_coordinate?('E1')
    assert_equal false, @board.valid_coordinate?('22')
  end

  def test_it_if_num_of_coords_is_equal_to_ship_length
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    assert_equal false, @board.same_length?(@cruiser, ['A1', 'A2'])
    assert_equal false, @board.same_length?(@submarine, ['A2', 'A3', 'A4'])
  end

  def test_it_if_coordinates_are_consecutive_for_submarine_on_same_letter
    @board = Board.new
    @submarine = Ship.new("Submarine", 2)
    assert_equal true, @board.consecutive_submarine_on_same_letter?(['A1', 'A2'])
    assert_equal false, @board.consecutive_submarine_on_same_letter?(['B3', 'B1'])
    assert_equal false, @board.consecutive_submarine_on_same_letter?(['B3', 'C1'])
  end

  def test_it_if_coordinates_are_consecutive_for_submarine_on_same_number
    @board = Board.new
    @submarine = Ship.new("Submarine", 2)
    # assert_equal false, @board.consecutive_submarine_on_same_number?(['A1', 'C1'])
    # assert_equal true, @board.consecutive_submarine_on_same_number?(['C1', 'B1'])
    assert_equal false, @board.consecutive_submarine_on_same_number?(['C1', 'B3'])
  end

  def test_it_if_coordinates_are_consecutive_for_cruiser_on_same_letter
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    assert_equal true, @board.consecutive_cruiser_on_same_letter?(['A3', 'A2', 'A1'])
    assert_equal true, @board.consecutive_cruiser_on_same_letter?(['A1', 'A2', 'A3'])
    assert_equal false, @board.consecutive_cruiser_on_same_letter?(['A4', 'A2', 'A1'])
  end

  def test_it_if_coordinates_are_consecutive_for_cruiser_on_same_number
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    assert_equal true, @board.consecutive_cruiser_on_same_number?(['A3', 'B3', 'C3'])
    assert_equal false, @board.consecutive_cruiser_on_same_number?(['A2', 'B3', 'C3'])
    assert_equal false, @board.consecutive_cruiser_on_same_number?(['A1', 'C1', 'D1'])
    assert_equal false, @board.consecutive_cruiser_on_same_number?(['A4', 'A2', 'A1'])
  end

  def test_it_is_a_valid_placement
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    assert_equal true, @board.valid_placement?(@cruiser, ['A1', 'A2', 'A3'])
    assert_equal true, @board.valid_placement?(@submarine, ['B1', 'C1'])
    assert_equal true, @board.valid_placement?(@cruiser, ['B1', 'C1', 'A1'])
    assert_equal false, @board.valid_placement?(@cruiser, ['B6', 'C1', 'A1'])
    assert_equal false, @board.valid_placement?(@submarine, ['B3', 'C1'])
    assert_equal true, @board.valid_placement?(@submarine, ['B1', 'C1'])
    assert_equal false, @board.valid_placement?(@cruiser, ['B1', 'C1'])
  end

  def test_it_ship_can_be_placed
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @board.place(@cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]
    cell_1.ship
    cell_2.ship
    cell_3.ship
    assert_equal true, cell_3.ship == cell_2.ship
  end
end
