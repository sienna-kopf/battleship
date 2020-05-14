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
    assert_equal true, @board.valid_coordinate?(:A1)
    assert_equal true, @board.valid_coordinate?(:D4)
    assert_equal false, @board.valid_coordinate?(:A5)
    assert_equal false, @board.valid_coordinate?(:E1)
    assert_equal false, @board.valid_coordinate?(:A22)
  end

  def test_it_can_validate_placement
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    assert_equal false, @board.valid_placement?(@cruiser, [:A1, :A2])
    assert_equal false, @board.valid_placement?(@submarine, [:A2, :A3, :A4])
  end

  def test_it_if_coordinates_are_consecutive
    assert_equal false, board.valid_placement?(cruiser, [:A1, :A2, :A4])
    assert_equal false, board.valid_placement?(submarine, [:A1, :C1])
    assert_equal false, board.valid_placement?(cruiser, [:A3, :A2, :A1])
    assert_equal false, board.valid_placement?(submarine, [:C1, :B1])
  end
end
