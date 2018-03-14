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

  def score_upper_section(roll, category)
    roll.reduce { |sum, die| sum += die == category ? die : 0 }
  end


end
