class Cell
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
    @ship.hit
  end

  def render(boolean = false)
    if empty? && fired_upon?
      'M'
    elsif !(empty?) && fired_upon? && @ship.sunk?
      'X'
    elsif !(empty?) && fired_upon?
      'H'
    elsif !(empty?) && !(fired_upon?) && boolean == true
      'S'
    elsif !(fired_upon?)
      '.'
    end
  end

end
