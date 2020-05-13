class Cell < Ship ## concept of inheritance. The cell class inherits all functionality of the ship class.
  attr_reader :coordinate,
              :ship

  def initialize(coordinate, ship = nil) #cells attribute
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(name)
    @ship = name
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if place_ship(ship)
      @ship.hit
    end
  end

  def render(boolean = true)
    if empty? && fired_upon?
      'M'
    elsif empty? && !(fired_upon?)
      '.'
    elsif !(empty?) && fired_upon? && @ship.sunk?
      'X'
    elsif !(empty?) && fired_upon?
      'H'
    else
      'S'
    end
  end

end
