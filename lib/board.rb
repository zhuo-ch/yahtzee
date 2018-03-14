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
  end

  def get_sets(roll)
    results = {}
    roll.each { |die| results[die] = results[die] ? results[die] + 1 : 1 }
    results
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

  end


end
