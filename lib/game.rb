class Game
  attr_reader :computer_player,
              :human_player,
              :game_turn

  def setup
    @computer_player = Player.new
    @human_player = Player.new
    @game_turn = Turn.new(@computer_player, @human_player)
  end

  def start
    game_starter
  end

  def setup_and_play
    board_setup
    turn
  end

  #prints the text on the screen for the human to read
  def print_welcome_message
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
  end

  #prompts user to put in input
  #return of this method is the input of the user
  def game_starter
    print_welcome_message
    input = gets.chomp.downcase

    while input != 'p' && input != 'q' do
      puts "Unexpected input, please try again:"
      input = gets.chomp.downcase
    end

    if input == 'p'
      setup_and_play
    end
  end

#runs computer and player board setup
  def board_setup
    computer_rand_placement
    player_ship_placement_user_input
  end

# The computer randomly places its ships.
# Checks valid placment due to the possibility for overlap
  def computer_rand_placement
    rand_cruiser_coords = all_cruiser_placements.sample
    #I think checking valid_placement? here is redundant since its the first ship placed
    until @computer_player.board.valid_placement?(@computer_player.cruiser, rand_cruiser_coords) do
      rand_cruiser_coords = all_cruiser_placements.sample
    end
    
    @computer_player.board.place(@computer_player.cruiser, rand_cruiser_coords)
    rand_sub_coords = all_sub_placements.sample
    until @computer_player.board.valid_placement?(@computer_player.submarine, rand_sub_coords) do
      rand_sub_coords = all_sub_placements.sample
    end
    @computer_player.board.place(@computer_player.submarine, rand_sub_coords)
  end

  def player_ship_placement_message
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts "#{@human_player.board.render}"
    puts "Enter the squares for the Cruiser (3 spaces):"
    print ">"
  end

  def player_ship_placement_user_input
    player_ship_placement_message
    cruiser_input = gets.chomp.upcase.split(" ").to_a
    until all_cruiser_placements.include?(cruiser_input) && @human_player.board.valid_placement?(@human_player.cruiser, cruiser_input)
      puts "Those are invalid coordinates. Plese try again:"
      cruiser_input = gets.chomp.upcase.split(" ").to_a
      # puts "Ships should be placed on linear, consecutive, cells from left to right or top to bottom."
    end
    @human_player.board.place(@human_player.cruiser, cruiser_input)
    puts "#{@human_player.board.render(true)}"

    puts "Enter the squares for the Submarine (2 spaces)"
    print ">"
    sub_input = gets.chomp.upcase.split(" ").to_a
    until all_sub_placements.include?(sub_input) && @human_player.board.valid_placement?(@human_player.submarine, sub_input)
      puts "Those are invalid coordinates. Plese try again:"
      sub_input = gets.chomp.upcase.split(" ").to_a
      # puts "Ships should be placed on linear, consecutive, cells from left to right or top to bottom."
    end
    @human_player.board.place(@human_player.submarine, sub_input)
    puts "#{@human_player.board.render(true)}"
  end

  def turn
    # dorion put the top part in a method
    until (@human_player.cruiser.sunk? && @human_player.submarine.sunk?) || (@computer_player.cruiser.sunk? && @computer_player.submarine.sunk?) do
      @game_turn.board_display
      @game_turn.player_shot
      @game_turn.computer_shot
    end
    if (@human_player.cruiser.sunk? && @human_player.submarine.sunk?) && (@computer_player.cruiser.sunk? && @computer_player.submarine.sunk?)
      @game_turn.board_display
      puts "Its a draw!"
    elsif @human_player.cruiser.sunk? && @human_player.submarine.sunk?
      @game_turn.board_display
      puts "I won"
    elsif @computer_player.cruiser.sunk? && @computer_player.submarine.sunk?
      @game_turn.board_display
      puts "You won"
    end
    setup
    start
  end

# Initializes an array with all possible placement array combinateions for the cruiser
  def all_cruiser_placements
    [
      ['A1', 'A2', 'A3'],
      ['B1', 'B2', 'B3'],
      ['C1', 'C2', 'C3'],
      ['D1', 'D2', 'D3'],
      ['A2', 'A3', 'A4'],
      ['B2', 'B3', 'B4'],
      ['C2', 'C3', 'C4'],
      ['D2', 'D3', 'D4'],
      ['A1', 'B1', 'C1'],
      ['A2', 'B2', 'C2'],
      ['A3', 'B3', 'C3'],
      ['A4', 'B4', 'C4'],
      ['B1', 'C1', 'D1'],
      ['B2', 'C2', 'D2'],
      ['B3', 'C3', 'D3'],
      ['B4', 'C4', 'D4']
    ]
  end
  # Initializes an array with all possible placement array combinateions for the submarine
  def all_sub_placements
    [
      ['A1','A2'],
      ['A2','A3'],
      ['A3','A4'],
      ['B1','B2'],
      ['B2','B3'],
      ['B3','B4'],
      ['C1','C2'],
      ['C2','C3'],
      ['C3','C4'],
      ['D1','D2'],
      ['D2','D3'],
      ['D3','D4'],
      ['A1','B1'],
      ['A2','B2'],
      ['A3','B3'],
      ['A4','B4'],
      ['B1','C1'],
      ['B2','C2'],
      ['B3','C3'],
      ['B4','C4'],
      ['C1','D1'],
      ['C2','D2'],
      ['C3','D3'],
      ['C4','D4']
    ]
  end
end
