class Turn
  attr_reader :computer_player,
              :human_player

  def initialize(computer_player, human_player)
    @computer_player = computer_player
    @human_player = human_player
  end

  def board_display
    puts "=============COMPUTER BOARD============="
    puts "#{@computer_player.board.render}"
    puts "==============PLAYER BOARD=============="
    puts "#{@human_player.board.render(true)}"
  end

  def player_shot_message
    puts "Enter the coordinate for your shot:"
    print ">"
  end

  ## prompts user to enter a coordinate to fire on, tells them if the coordinate entered is valid or not, and returns the result of the shot
  def player_shot
    player_shot_message
    input = gets.chomp
    until @computer_player.board.is_valid_coordinate?(input)
      puts "Please enter a valid coordinate:"
      print ">"
      input = gets.chomp
    end
    @computer_player.board.cells[input].fire_upon
    puts "Your shot on #{input} #{@computer_player.board.cells[input].text_render}"
  end

  #selects a random cell out of the player_board for the computer to fire on
  def select_random_cell
    @human_player.board.cells.keys.sample
  end

  ## randomly selects a coordinate on the player board to shoot on, checks to make sure its "valid" and then shoots on that coordinate before returning the results of the shot
  def computer_shot
    # rand_comp_shot = @player_board.cells.keys.sample
    rand_computer_shot = select_random_cell
    until @human_player.board.is_valid_coordinate?(rand_computer_shot) && @human_player.board.cells[rand_computer_shot].fired_upon? == false do
      rand_computer_shot = select_random_cell
    end
    @human_player.board.cells[rand_computer_shot].fire_upon
    puts "My shot on #{rand_computer_shot} #{@human_player.board.cells[rand_computer_shot].text_render}"
    # @player_board.cells.delete(rand_comp_shot)
  end

end
