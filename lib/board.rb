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
  end
    # end

    #     # think about splitting the array into numbers and letters
    #     # iterate through odd ele (LETTERS) and even ele (NUMBERS)
    #     # break down to simplist possible version
    #     # simplist way to compare coordinates is compare a coordinate to itself. Do I want to split it, take ord values etc
    #     # second most complicated is thinking about two coordinates. Not necessarily iterating
    #
    # else
    #   coordinates.each do |coord|  ## not necessarily need to iterate.
    #
    #   end
    # end

  #   coordinates.each_cons(2) do |coord|
  #     #rather than each_cons... maybe start with each and then figure out what enumerable allows you to do what you want to do
  #       if coord[0][0].ord == coord[1][0].ord
  #         if coord[0][1].to_i + 1 == coord[1][1].to_i
  #           valid_collector << :valid_coordinate
  #         end
  #       elsif coord[0][0].ord + 1 == coord[1][0].ord
  #         if coord[0][1].to_i == coord[1][1].to_i
  #           valid_collector << :valid_coordinate
  #         end
  #       else
  #         require "pry"; binding.pry
  #         valid_collector << :invalid_coordinate
  #       end
  #   end
  #
  # end
  #
  # valid_collector.all? do |verification|
  #   if verification == :valid_coordinate
  #     true
  #   end
  # end




    # this method will be long at the end, think about refactoring accoridng to SRP. GET THROUGH PROJECT FIRST

    #look on project page for other methods

    #each_cons method for hashes
    #take each consecutive pair in block have first and second ele and then next time it increments
    # key doesnt have to be an integer

    # .ord ordinal value
    #could be helpful for compare, works for integers and alphebet

  #   index = 0
  #   (ship.length == coordinates.count &&
  #    coordinates[index][1].to_i + 1 ==
  #         coordinates[index +1][1].to_i )
  #
  #
  #   consecutive = coordinates.map do |coordinate|
  #     (coordinates[index][1].to_i + 1 ==
  #         coordinates[index +1][1].to_i)
  #      index += 1
  #   end
  # end
end
