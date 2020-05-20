class Turn
  attr_reader :cruiser_play,
              :submarine_play,
              :cruiser_comp,
              :submarine_comp,
              :computer_board,
              :player_board

  def initialize
    @cruiser_play = Ship.new("Cruiser", 3)
    @submarine_play = Ship.new("Submarine", 2)
    @cruiser_comp = Ship.new("Cruiser", 3)
    @submarine_comp = Ship.new("Submarine", 2)
    @computer_board = Board.new
    @player_board = Board.new
  end

  def board_display
    puts "=============COMPUTER BOARD============="
    puts "#{@computer_board.render}"
    puts "==============PLAYER BOARD=============="
    puts "#{@player_board.render(true)}"
  end

  def is_valid_coordinate?(coordinate)
    @computer_board.cells.include?(coordinate)
  end

  def player_shot_message
    puts "Enter the coordinate for your shot:"
    print ">"
  end

  ## prompts user to enter a coordinate to fire on, tells them if the coordinate entered is valid or not, and returns the result of the shot
  def player_shot
    player_shot_message
    input = gets.chomp
    until is_valid_coordinate?(input)
      puts "Please enter a valid coordinate:"
      print ">"
      input = gets.chomp
    end
    @computer_board.cells[input].fire_upon
    puts "Your shot on #{input} #{@computer_board.cells[input].text_render}"
  end

  #selects a random cell out of the player_board for the computer to fire on
  def select_random_cell
    @player_board.cells.keys.sample
  end

  ## randomly selects a coordinate on the player board to shoot on, checks to make sure its "valid" and then shoots on that coordinate before returning the results of the shot
  def computer_shot
    # rand_comp_shot = @player_board.cells.keys.sample
    rand_computer_shot = select_random_cell
    until is_valid_coordinate?(rand_computer_shot) && @player_board.cells[rand_computer_shot].fired_upon? == false do
      rand_computer_shot = select_random_cell
    end
    @player_board.cells[rand_computer_shot].fire_upon
    puts "My shot on #{rand_computer_shot} #{@player_board.cells[rand_computer_shot].text_render}"
    # @player_board.cells.delete(rand_comp_shot)
  end

end
