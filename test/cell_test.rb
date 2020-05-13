require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test
  def setup
    @cell = Cell.new('B4')
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_no_ship_is_nil
    assert_nil nil, @cell.ship
  end

  def test_it_is_empty
    assert_equal true, @cell.empty?
  end

  def test_it_can_place_ship
    @cell.place_ship(@cruiser)

    assert_equal @cruiser, @cell.ship
    assert_equal false, @cell.empty?
  end

  def test_has_it_been_fired_upon
    assert_equal false, @cell.fired_upon?
    @cell.fire_upon
    assert_equal true, @cell.fired_upon?
  end

  def test_health_decreases_after_hit
    @cell.place_ship(@cruiser)
    assert_equal 3, @cell.ship.health
    @cell.fire_upon
    assert_equal 2, @cell.ship.health
    assert_equal true, @cell.fired_upon?
  end

  def test_it_can_be_rendered_none_miss_hit
    assert_equal false, @cell.fired_upon?
    assert_equal '.', @cell.render
    @cell.fire_upon
    assert_equal 'M', @cell.render
    @cell.place_ship(@cruiser)
    @cell.fire_upon
    assert_equal 'H', @cell.render
  end

  def test_if_hit_sinks_ship_render_X
    dinghy = Ship.new("Dinghy", 1)

    assert_equal '.', @cell.render
    assert_equal 1, dinghy.health

    @cell.place_ship(dinghy)
    @cell.fire_upon
    assert_equal 'X', @cell.render
    assert_equal 0, dinghy.health
    assert_equal true, dinghy.sunk?
  end

  def test_render_with_optional_boolean_arg
    assert_nil nil, @cell.render(false)


    @cell.place_ship(@cruiser)
    assert_equal 'S', @cell.render(true)
  end

  def test_full_interaction_pattern
    assert_equal '.', @cell.render
    @cell.fire_upon
    assert_equal 'M', @cell.render

    cell_2 = Cell.new('C3')
    cell_2.place_ship(@cruiser)
    assert_equal '.', cell_2.render ## differentiate between 'S' and '.'
    assert_equal 'S', cell_2.render(true)
    cell_2.fire_upon
    assert_equal 'H', cell_2.render
    assert_equal false, @cruiser.sunk?
    @cruiser.hit
    @cruiser.hit
    assert_equal true, @cruiser.sunk?
    assert_equal 'X', cell_2.render
  end

end
