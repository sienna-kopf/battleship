require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require 'pry'

class CellTest < Minitest::Test
  def setup
    @cell = Cell.new('B4')
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

end
