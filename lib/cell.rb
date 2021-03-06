class Cell ## concept of inheritance. The cell class inherits all functionality of the ship class.
  # don't do

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
    if !(empty?)
      @ship.hit
    end
  end

  def render(boolean = false)
    if empty? && fired_upon?
      'M'
    elsif !(empty?) && fired_upon? && @ship.sunk?
      'X'
    elsif !(empty?) && fired_upon? && !(@ship.sunk?)
      'H'
    elsif !(empty?) && !(fired_upon?) && boolean == true && !(@ship.sunk?)
      'S'
    elsif !(fired_upon?) #&& !(@ship.sunk?)
      '.'
    end
  end

  def text_render
    if render == 'M'
      "was a miss."
    elsif render == 'X'
      "sunk the ship."
    elsif render == 'H'
      "was a hit."
    end
  end

end
