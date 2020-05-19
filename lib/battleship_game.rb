require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'

class Battleship
  attr_reader :user, :computer

  def setup
    @board = Board.new
    @cruiser1 = Ship.new('Cruise', 3)
    @cruiser2 = Ship.new('Cruise', 3)
    @submarine1 = Ship.new('Submarine', 2)
    @submarine2 = Ship.new('Submarine', 2)
    @user = Player.new
    @computer = Player.new
  end

  def start
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    print ":"
    input = gets.chomp

    if input == "p"
      puts "Let's play Battleship"
      puts "We will play on a 4x4 grid sized board"
      puts "Press the enter to continue"
      print ":"
      input == gets.chomp
      input == ""
      puts "I will place 2 ships."
      puts "1 cruiser ship with a length of 3"
      puts "1 submarine ship with a length of 2"
      puts "Press the enter to continue"
      print ":"
      input == gets.chomp
      input == ""
      puts "I have laid out my ships on the grid."
      puts "You now need to lay out your ships"
      puts "You get 2 ships, a cruiser with a lenght of 3"
      puts "And a submarine with a length of 2"
      puts "Press the enter to continue"
      print ":"
      input == gets.chomp
      input == ""
      puts @baord.render
      puts "Place yo"

      @computer.place(@submarine1, )
    end
  end

  def turn

  end
end

game = Battleship.new
game.setup
game.start


# Reija Dahlia Laleh
