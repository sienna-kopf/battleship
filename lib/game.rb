class Game
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

  def setup

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
    until @computer_board.valid_placement?(@cruiser_comp, rand_cruiser_coords) do
      rand_cruiser_coords = all_cruiser_placements.sample
    end
    @computer_board.place(@cruiser_comp, rand_cruiser_coords)

    rand_sub_coords = all_sub_placements.sample
    until @computer_board.valid_placement?(@submarine_comp, rand_sub_coords) do
      rand_sub_coords = all_sub_placements.sample
    end
    @computer_board.place(@submarine_comp, rand_sub_coords)
  end

  def player_ship_placement_message
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts "#{@player_board.render}"
    puts "Enter the squares for the Cruiser (3 spaces):"
    print ">"
  end

  def player_ship_placement_user_input
    player_ship_placement_message
    cruiser_input = gets.chomp.split(" ").to_a
    until @player_board.valid_placement?(@cruiser_play, cruiser_input) do
      puts "Those are invalid coordinates. Plese try again:"
      # puts "Ships should be placed on linear, consecutive, cells from left to right or top to bottom."
      cruiser_input = gets.chomp.split(" ").to_a
    end
    @player_board.place(@cruiser_play, cruiser_input)
    puts "#{@player_board.render(true)}"
    puts "Enter the squares for the Submarine (2 spaces)"
    print ">"
    sub_input = gets.chomp.split(" ").to_a
    until @player_board.valid_placement?(@submarine_play, sub_input) do
      puts "Those are invalid coordinates. Plese try again:"
      # puts "Ships should be placed on linear, consecutive, cells from left to right or top to bottom."
      sub_input = gets.chomp.split(" ").to_a
    end
    @player_board.place(@submarine_play, sub_input)
    puts "#{@player_board.render(true)}"
  end

  def board_display
    puts "=============COMPUTER BOARD============="
    puts "#{@computer_board.render}"
    puts "==============PLAYER BOARD=============="
    puts "#{@player_board.render(true)}"
  end

  def player_shot_message
    puts "Enter the coordinate for your shot:"
    print ">"
  end

  def is_valid_coordinate?(coordinate)
    @computer_board.cells.include?(coordinate)
  end

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

  def computer_shot
    rand_comp_shot = @player_board.cells.keys.sample
    @player_board.cells[rand_comp_shot].fire_upon
    puts "My shot on #{rand_comp_shot} #{@player_board.cells[rand_comp_shot].text_render}"
  end

  def turn
    require "pry"; binding.pry
    until (@cruiser_play.sunk? && @submarine_play.sunk?) || (@cruiser_comp.sunk? && @submarine_comp.sunk?) do
      board_display
      player_shot
      computer_shot
    end

    if @cruiser_play.sunk? && @submarine_play.sunk?
      puts "I won"
    elsif @cruiser_comp.sunk? && @submarine_comp.sunk?
      puts "You won"
    end
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
