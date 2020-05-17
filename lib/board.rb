class Board
  def initialize
    @cells = {
      'A1' => @A1 = Cell.new('A1'),
      'A2' => @A2 = Cell.new('A2'),
      'A3' => @A3 = Cell.new('A3'),
      'A4' => @A4 = Cell.new('A4'),
      'B1' => @B1 = Cell.new('B1'),
      'B2' => @B2 = Cell.new('B2'),
      'B3' => @B3 = Cell.new('B3'),
      'B4' => @B4 = Cell.new('B4'),
      'C1' => @C1 = Cell.new('C1'),
      'C2' => @C2 = Cell.new('C2'),
      'C3' => @C3 = Cell.new('C3'),
      'C4' => @C4 = Cell.new('C4'),
      'D1' => @D1 = Cell.new('D1'),
      'D2' => @D2 = Cell.new('D2'),
      'D3' => @D3 = Cell.new('D3'),
      'D4' => @D4 = Cell.new('D4')
    }
  end

  def valid_coordinate?(coordinate)
    @cells.any? do |coord, __|
      coordinate == coord
    end
  end

  def valid_placement?(ship, coords)
    if ship.length == 2
      same_length?(ship, coords) && (consecutive_submarine_on_same_letter?(coords) || consecutive_submarine_on_same_number?(coords))
    elsif ship.length == 3
      same_length?(ship, coords) && (consecutive_cruiser_on_same_letter?(coords) || consecutive_cruiser_on_same_number?(coords))
    end
  end

  def same_length?(ship, coords)
    coords.count == ship.length
  end

  def consecutive_submarine_on_same_letter?(coords)
    if coords.join.split(//).uniq.count <= 3
      numbers = []
      numbers << coords.join.delete('ABCD').split(//)
      numbers.flatten!.sort!
      numbers.each_cons(2) do |n1, n2|
        if n2.to_i == n1.to_i + 1
          return true
        else
          return false
        end
      end
    else
      return false
    end
  end

  def consecutive_submarine_on_same_number?(coords)
    if coords.join.split(//).uniq.count <= 3
      numbers = []
      numbers << coords.join.delete('1234').split(//)
      numbers.flatten!.sort!
      numbers.each_cons(2) do |n1, n2|
        if n2.ord == n1.ord + 1
          return true
        else
          return false
        end
      end
    else
      return false
    end
  end

  def consecutive_cruiser_on_same_letter?(coords)
    if coords.join.split(//).uniq.count <= 4
      numbers = []
      numbers << coords.join.delete('ABCD').split(//)
      numbers.flatten!.sort!
      numbers.each_cons(3) do |n1, n2, n3|
        if n2.to_i == n1.to_i + 1 && n3.to_i == n2.to_i + 1
          return true
        else
          return false
        end
      end
    else
      return false
    end
  end

  def consecutive_cruiser_on_same_number?(coords)
    if coords.join.split(//).uniq.count <= 4
      numbers = []
      numbers << coords.join.delete('1234').split(//)
      numbers.flatten!.sort!
      numbers.each_cons(3) do |n1, n2, n3|
        if n2.ord == n1.ord + 1 && n3.ord == n2.ord + 1
          return true
        else
          return false
        end
      end
    else
      return false
    end
  end

  def place(ship, coordinates)

    # binding.pry

  end
end
