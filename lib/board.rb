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
    @cells.keys.include?(cell_coordinate)
  end

  def is_valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate) #&& !(@cells[coordinate].fired_upon?)
  end

  def has_been_fired_upon(coordinate)
    if valid_coordinate?(coordinate)
      @cells[coordinate].fired_upon?
    end 
  end

  def is_valid_coordinate?(coordinate)
    @cells.include?(coordinate) && !(@cells[coordinate].fired_upon?)
  end

  def valid_placement?(ship, coords)
    coords.each do |coordinate|
      if !(@cells[coordinate].empty?) || !(valid_coordinate?(coordinate))
        return false
      end
    end



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
      numbers.flatten!
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
      letters = []
      letters << coords.join.delete('1234').split(//)
      letters.flatten!
      letters.each_cons(2) do |n1, n2|
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
      numbers.flatten!
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
      letters = []
      letters << coords.join.delete('1234').split(//)
      letters.flatten!
      letters.each_cons(3) do |n1, n2, n3|
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
    coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end

  def render(boolean = false)
    if boolean == true
      ("  1 2 3 4 \n" +
       "A #{@cells['A1'].render(true)} #{@cells['A2'].render(true)} #{@cells['A3'].render(true)} #{@cells['A4'].render(true)} \n" +
       "B #{@cells['B1'].render(true)} #{@cells['B2'].render(true)} #{@cells['B3'].render(true)} #{@cells['B4'].render(true)} \n" +
       "C #{@cells['C1'].render(true)} #{@cells['C2'].render(true)} #{@cells['C3'].render(true)} #{@cells['C4'].render(true)} \n" +
       "D #{@cells['D1'].render(true)} #{@cells['D2'].render(true)} #{@cells['D3'].render(true)} #{@cells['D4'].render(true)} \n")
    else
      ("  1 2 3 4 \n" +
       "A #{@cells['A1'].render} #{@cells['A2'].render} #{@cells['A3'].render} #{@cells['A4'].render} \n" +
       "B #{@cells['B1'].render} #{@cells['B2'].render} #{@cells['B3'].render} #{@cells['B4'].render} \n" +
       "C #{@cells['C1'].render} #{@cells['C2'].render} #{@cells['C3'].render} #{@cells['C4'].render} \n" +
       "D #{@cells['D1'].render} #{@cells['D2'].render} #{@cells['D3'].render} #{@cells['D4'].render} \n")
    end
  end

end
