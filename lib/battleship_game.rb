require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'


class Battleship

  def start
    cruiser_coordinate = [
                                        ['A1', 'A2', 'A3'],
                                        ['A2', 'A3', 'A4'],
                                        ['B1', 'B2', 'B3'],
                                        ['B2', 'B3', 'B4'],
                                        ['C1', 'C2', 'C3'],
                                        ['C2', 'C3', 'C4'],
                                        ['D1', 'D2', 'D3'],
                                        ['D2', 'D3', 'D4'],
                                        ['A1', 'B1', 'C1'],
                                        ['B1', 'C1', 'D1'],
                                        ['A2', 'B2', 'C2'],
                                        ['B2', 'C2', 'D2'],
                                        ['A3', 'B3', 'C3'],
                                        ['B3', 'C3', 'D3'],
                                        ['A4', 'B4', 'C4'],
                                        ['B4', 'C4', 'D4']
                                      ]

    submarine_coordinate = [
                                        ['A1', 'A2'],
                                        ['A2', 'A3'],
                                        ['A3', 'A4'],
                                        ['B1', 'B2'],
                                        ['B2', 'B3'],
                                        ['B3', 'B4'],
                                        ['C1', 'C2'],
                                        ['C2', 'C3'],
                                        ['C3', 'C4'],
                                        ['D1', 'D2'],
                                        ['D2', 'D3'],
                                        ['D3', 'D4'],
                                        ['A1', 'B1'],
                                        ['B1', 'C1'],
                                        ['C1', 'D1'],
                                        ['A2', 'B2'],
                                        ['B2', 'C2'],
                                        ['C2', 'D2'],
                                        ['A3', 'B3'],
                                        ['B3', 'C3'],
                                        ['C3', 'D3'],
                                        ['A4', 'B4'],
                                        ['B4', 'C4'],
                                        ['C4', 'D4']
                                      ]

    @board1 = Board.new
    @board2 = Board.new
    @cruiser1 = Ship.new('Cruise', 3)
    @cruiser2 = Ship.new('Cruise', 3)
    @submarine1 = Ship.new('Submarine', 2)
    @submarine2 = Ship.new('Submarine', 2)

    puts "Welcome to BATTLESHIP"
    puts "Enter 'p' or 'Enter' to play. Enter 'q' to quit."
    print ":"
    input = gets.chomp

    if input == 'p'
      puts "Let's play Battleship"
      puts "We will play on a 4x4 grid sized board"
      cruisecoords = cruiser_coordinate.shuffle.first
      subcoords = submarine_coordinate.shuffle.first
      @board1.place(@cruiser1, cruisecoords)
      @board1.place(@submarine1, subcoords)
      puts "Press the enter to continue"
      print ":"
      input == gets.chomp
      input == ""
      puts "You get 2 ships\nA cruiser with a lenght of 3\nAnd a submarine with a length of 2"
      puts "Here is your board:"
      puts @board2.render(true)
      coords_for_cruiser = []
      puts "Enter the squares for the Cruiser (3 spaces): Example 'A1 A2 A3'."
      print ":"
      user_input = gets.chomp
      coords_for_cruiser << user_input
      coords_for_cruiser.join.split
      until @board2.valid_placement?(@cruiser2, coords_for_cruiser.join.split.sort!) == true
        puts "Those are invalid coordinates. Please try again:"
        print ":"
        user_input = gets.chomp
        coords_for_cruiser = []
        coords_for_cruiser << user_input
      end
      @board2.place(@cruiser2, coords_for_cruiser.join.split)
      puts @board2.render(true)
      coords_for_submarine = []
      puts "Enter the squares for the Submarine (2 spaces): Example 'A1 A2'."
      print ":"
      user_input2 = gets.chomp
      coords_for_submarine << user_input2
      coords_for_submarine.join.split
      until @board2.valid_placement?(@submarine2, coords_for_submarine.join.split) == true
        puts "Those are invalid coordinates. Please try again: Example 'A1 A2'"
        print ":"
        user_input = gets.chomp
        coords_for_submarine = []
        coords_for_submarine << user_input
      end
      @board2.place(@cruiser2, coords_for_submarine.join.split)
      puts @board2.render(true)
    elsif input == "q"
      puts "You quit."
    else
      puts "Invalid input. Please try again"
    end
  end

  def turn
    puts "=============== COMPUTER BOARD ==============="
    puts @board1.render
    puts "================ PLAYER BOARD ================"
    puts @board2.render(true)
    puts "Computer fires first. Press Enter to continue:"
    input = gets.chomp
    input == ""
    binding.pry
    @board2.cells[''].fire_upon
    puts @board2.render(true)
    puts "Choose a coordinate to fire upon the opponents board"
    print ":"
    input = gets.chomp
    @board1.cells['input'].fire_upon

  end
end

game = Battleship.new
game.start
game.turn


# Reija Dahlia Laleh

# until @board2.valid_placement? == true
#   until @board2.valid_coordinate?(coord1) == true
#     puts "Invalid coordinate. Please try again."
