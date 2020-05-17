require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

class GameTest < Minitest::Test
  def setup
    @battleship = Game.new
  end

  def test_it_exists
    assert_instance_of Game, @battleship
  end

  # def test_return_of_welcome_message_is_nil
  #   assert_nil nil , @battleship.print_welcome_message
  # end
  #
  #
  # def test_valid_input_loop_run
  #   @battleship.retrieve_valid_input
  #
  # end

  def test_computer_ship_placement
    @battleship.setup
    @battleship.computer_place_ships

    assert_equal true, @battleship.board.valid_placement?(rand_ship, rand_coordinates)
  end


  # def test_retrieve_valid_input
  #   # assert_equal "Yes valid input", @battleship.retrieve_valid_input(true)
  #   # assert_equal "OK thats a valid input", @battleship.retrieve_valid_input("GO")
  # end
  # #
  # # def test_force_user_to_input_something_valid
  # #   assert_equal "OK thats a valid input", @battleship.retrieve_valid_input
  # # end

end
