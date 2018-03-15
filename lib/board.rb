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

  def is_valid_selection?(score)
    score > 0
  end

  def score_upper_section(roll, category)
    score = roll.dice.reduce { |sum, die| sum += die == category ? die : 0 }

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
