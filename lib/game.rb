class Game
  attr_reader :cruiser,
              :submarine,
              :computer_board,
              :player_board

  def setup
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @computer_board = Board.new
    @player_board = Board.new
  end

  def start
    retrieve_valid_input
  end

  def print_welcome_message
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
  end

  def retrieve_valid_input
    print_welcome_message
    input = gets.chomp
    idiot_input_count = 0
    until input == 'q' || input == 'p' do
      idiot_input_count += 1
      print_welcome_message
      input = gets.chomp
    end
    if idiot_input_count < 1
      p "YAY you can read!"
    else
      p "Good job it only took you #{idiot_input_count} tries idiot"
    end
  end

end
