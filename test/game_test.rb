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

  # def test_computer_randomizes_a_valid_pick_for_ship_placement
  #   @battleship.computer_rand_placement
  #
  #
  #   # assert_equal true, @battleship.computer_rand_placement
  # end

  # def test_player_placement_input
  #   @battleship.cruiser_input_for_player_ship_placement
  # end

  # def test_retrieve_valid_input
  #   # assert_equal "Yes valid input", @battleship.retrieve_valid_input(true)
  #   # assert_equal "OK thats a valid input", @battleship.retrieve_valid_input("GO")
  # end
  # #
  # # def test_force_user_to_input_something_valid
  # #   assert_equal "OK thats a valid input", @battleship.retrieve_valid_input
  # # end

  # def test_all_possibilities_for_cruiser_placement
  #   @battleship.computer_rand_placement
  #
  #   # assert_equal true, @battleship.computer_board.valid_placement?(@cruiser, cruiser_coordinates_for_comp)
  # end

  # def test_board_setup
  #   @battleship.board_setup
  # end

  def test_players_shot
    @battleship.board_setup
    @battleship.board_display
    @battleship.player_shot
    @battleship.computer_shot
    @battleship.board_display
  end

end
