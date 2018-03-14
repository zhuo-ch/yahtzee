class Board
  def initialize
    @labels = [
      "Aces",
      "Twos",
      "Threes",
      "Fours",
      "Fives",
      "Sixes",
      "Three of a Kind",
      "Four of a Kind",
      "Full House",
      "Small Straight",
      "Large Straight",
      "Yahtzee",
      "Chance",
    ]
    @board = Array.new(@labels.length) { Array.new() }
    @keys = { "0": 'aces', '1': 'twos', '2': 'threes', '3': 'fours', '4': 'fives',
      '5': 'sixes', '6': 'three kind', '7': 'four kind', '8': 'full house',
      '9': 'small', '10': 'large', '11': 'yahzee', '12': 'chance'
    }
  end

  def get_sets(roll)
    results = {}
    roll.each { |die| results[die] = results[die] ? results[die] + 1 : 1 }
    results
  end

  def validate_straight(roll, len)
    nums = get_sets(roll).keys.sort { |a, b| a <=> b }
    idx = 0

    while idx < len
      if nums[idx] != nums[idx + 1] - 1
        return false
      end

      idx += 1
    end

    true
  end

  def validate_set(roll, category)
    get_sets(roll).values.include?(category)
  end

  def validate_full_house(roll)
    sets = get_sets(roll)
    sets.values.include?(3) && sets.values.include?(2)
  end

  def score_upper_section(roll, category)
    roll.reduce { |sum, die| sum += die == category ? die : 0 }
  end

  def score_lower_section(roll, category)
    case category
    when 6
      validate_set(roll, category)
    when 7
      validate_set(roll, category)
    when 8
      validate_full_house(roll)
    when 9
      validate_straight(roll, 4)
    when 10
      validate_straight(roll, 5)
    when 11
      validate_set(roll, 5)
    when 12
      roll.reduce(:+)
    end
  end


end
