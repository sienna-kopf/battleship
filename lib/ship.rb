class Ship
  attr_reader :name,
              :length

  def initialize(name, length)
    @name = name
    @length = length
    @health = @length
  end

  def health
    @health
  end

  def hit
    @health -= 1
  end

  def sunk?
    return true if health == 0  ## how to know whether to include the @symbol?
    false
  end

end
