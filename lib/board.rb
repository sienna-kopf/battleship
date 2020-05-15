class Board
  attr_reader :cells

  def initialize
    @cells = {
      'A1' => Cell.new('A1'),
      'A2' => Cell.new('A2'),
      'A3' => Cell.new('A3'),
      'A4' => Cell.new('A4'),
      'B1' => Cell.new('B1'),
      'B2' => Cell.new('B2'),
      'B3' => Cell.new('B3'),
      'B4' => Cell.new('B4'),
      'C1' => Cell.new('C1'),
      'C2' => Cell.new('C2'),
      'C3' => Cell.new('C3'),
      'C4' => Cell.new('C4'),
      'D1' => Cell.new('D1'),
      'D2' => Cell.new('D2'),
      'D3' => Cell.new('D3'),
      'D4' => Cell.new('D4')
    }
  end

  def valid_coordinate?(cell_coordinate)
    @cells.include?(cell_coordinate)
  end

  def valid_placement?(ship, coords)
    if ship.length != coords.count
      return false
    end

    coords.each do |coordinate|
      if !(@cells[coordinate].empty?)
        return false
      end
    end

    coordinates = coords.join.split(//)
    if ship.length == 2 ## no need to iterate
      if coordinates[0].ord == coordinates[2].ord
        if coordinates[1].to_i + 1 == coordinates[3].to_i
          return true
        else
          return false
        end
      elsif coordinates[0].ord + 1 == coordinates[2].ord
        if coordinates[1].to_i == coordinates[3].to_i
          return true
        else
          return false
        end
      else
        return false
      end
    elsif ship.length == 3
      if coordinates[0].ord == coordinates[2].ord && coordinates[2].ord == coordinates[4].ord
        if coordinates[1].to_i + 1 == coordinates[3].to_i && coordinates[3].to_i + 1 == coordinates[5].to_i
          return true
        else
          return false
        end
      elsif coordinates[0].ord + 1 == coordinates[2].ord && coordinates[2].ord + 1 == coordinates[4].ord
        if coordinates[1].to_i == coordinates[3].to_i && coordinates[3].to_i == coordinates[5].to_i
          return true
        else
          return false
        end
      else
        return false
      end
    end

    #     # think about splitting the array into numbers and letters
    #     # iterate through odd ele (LETTERS) and even ele (NUMBERS)
    #     # break down to simplist possible version
    #     # simplist way to compare coordinates is compare a coordinate to itself. Do I want to split it, take ord values etc
    #     # second most complicated is thinking about two coordinates. Not necessarily iterating

  end

  def place(ship, coordinates)
    coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end

  end

end
