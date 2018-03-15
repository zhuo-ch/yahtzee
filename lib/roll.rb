require 'minitest/autorun'
require 'byebug'
require 'pry'
require 'minitest/stub_any_instance'

class Roll
  attr_accessor :dice

  def self.roll_die
    rand(1..6).floor
  end

  def initialize
    @dice = Array.new(5) { Roll.roll_die }
  end

  def show_roll
    @dice
  end

  def reroll(dice)
    dice.each { |die| @dice[die] = Roll.roll_die }

    show_roll
  end

  def get_sets
    results = {}
    show_roll.each { |die| results[die] = results[die] ? results[die] + 1 : 1 }

    results
  end

  def validate_straight(len)
    nums = get_sets.keys.sort { |a, b| a <=> b }
    idx = 1

    while idx < nums.length && idx < len
      if nums[idx] - 1 != nums[idx - 1]
        return false
      end

      idx += 1
    end

    true
  end

  def validate_set(category)
    get_sets.values.include?(category)
  end

  def validate_full_house
    get_sets.values.include?(3) && sets.values.include?(2)
  end
end

class TestRoll < Minitest::Test
  def setup
    @roll = Roll.new
  end

  def test_rolls_within_range
    assert(Roll.roll_die > 0 && Roll.roll_die < 7)
  end

  def test_creates_new_roll_with_five_dice
    assert_equal 5, @roll.show_roll.length
  end

  def test_rerolls_missing_dice
    old_roll = @roll.show_roll.collect { |die| die }
    refute_equal old_roll, @roll.reroll([2, 4])
  end

  def test_get_sets_returns_roll_elements
    assert_empty @roll.show_roll - @roll.get_sets.keys
  end

  def test_validate_straight_small_straight
    Roll.stub_any_instance(:show_roll, [3, 4, 1, 2, 3]) do
      roll = Roll.new
      assert true, roll.validate_straight(4)
    end
  end

  def test_validate_straight_small_straight_negative
    Roll.stub_any_instance(:show_roll, [3, 4, 6, 2, 3]) do
      roll = Roll.new
      assert_equal false, roll.validate_straight(4)
    end
  end
end
