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
    assert_equal false, @board.consecutive_submarine_on_same_number?(['A1', 'C1'])
    assert_equal false, @board.consecutive_submarine_on_same_number?(['C1', 'B1'])
    assert_equal false, @board.consecutive_submarine_on_same_number?(['C1', 'B3'])
  end

  def test_it_if_coordinates_are_consecutive_for_cruiser_on_same_letter
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    assert_equal false, @board.consecutive_cruiser_on_same_letter?(['A3', 'A2', 'A1'])
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

  def test_placing_same_ship_obj_in_multiple_cells
    @board.place(@cruiser, ['A1', 'A2', 'A3'])
    cell_1 = @board.cells['A1']
    cell_2 = @board.cells['A2']
    cell_3 = @board.cells['A3']

    assert_equal @cruiser, cell_1.ship
    assert_equal @cruiser, cell_2.ship
    assert_equal @cruiser, cell_3.ship
    assert cell_3.ship == cell_2.ship
  end

  def test_overlapping_ship_placement
    @board.place(@cruiser, ['A1', 'A2', 'A3'])

    assert_equal false, @board.valid_placement?(@submarine, ['A1', 'A2'])
    assert_equal true, @board.valid_placement?(@submarine, ['C1', 'D1'])
  end

  def test_render_for_empty_board_and_hidden_ships
    assert_equal ("  1 2 3 4 \n" +
                  "A . . . . \n" +
                  "B . . . . \n" +
                  "C . . . . \n" +
                  "D . . . . \n"), @board.render

    @board.place(@cruiser, ['A1', 'A2', 'A3'])

    assert_equal ("  1 2 3 4 \n" +
                  "A . . . . \n" +
                  "B . . . . \n" +
                  "C . . . . \n" +
                  "D . . . . \n"), @board.render
    assert_equal ("  1 2 3 4 \n" +
                  "A S S S . \n" +
                  "B . . . . \n" +
                  "C . . . . \n" +
                  "D . . . . \n"), @board.render(true)
  end

  def test_render_for_board_with_misses_and_hits_and_optional_boolean_val
    @board.place(@cruiser, ['A1', 'A2', 'A3'])
    @board.place(@submarine, ['C1', 'D1'])
    @board.cells['A1'].fire_upon
    @board.cells['B4'].fire_upon
    @board.cells['C1'].fire_upon
    @board.cells['D1'].fire_upon

    assert_equal ("  1 2 3 4 \n" +
                  "A H . . . \n" +
                  "B . . . M \n" +
                  "C X . . . \n" +
                  "D X . . . \n"), @board.render
    assert_equal ("  1 2 3 4 \n" +
                  "A H S S . \n" +
                  "B . . . M \n" +
                  "C X . . . \n" +
                  "D X . . . \n"), @board.render(true)
  end
end
