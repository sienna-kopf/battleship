class Cell
  attr_reader :coordinate,
              :ship_obj

  def initialize(coordinate)
    @coordinate = coordinate
    # @empty = false
    @ship_obj = ship_obj
  end

  def empty?
    return false if ship != nil
    true
  end

  def place_ship(name)
    @ship_obj = name
  end

  def ship
    @ship_obj
  end

end
