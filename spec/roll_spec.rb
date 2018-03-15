require 'minitest/autorun'
require_relative '../lib/roll.rb'

class TestRoll < Minitest::Test
  def setup
    @roll = Roll.new
  end

  def test_creates_new_roll_with_five_dice
    assert_equal 5, @roll.show_roll.length
  end
end
