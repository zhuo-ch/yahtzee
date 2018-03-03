# require 'test/unit'
#
class YahtzeeTest < Test::Unit::TestCase
  def setup
    @roll = { dice: [1,1,1,2,4], }
  end
## round
  # each player gets three rolls
  # can choose to end turn after 1 or two rolls
  # after first/second roll, player may choose to save any amount of dice
  # unsaved dice are rerolled
  # no reroll after 3rd roll

## scorecard
  # 13 categories
  # upper
    # aces - any combo, scores sum of ones

def scorecard_aces(roll)
  roll[:dice].reduce { |accum, el| accum + (el == 1 ? el : 0) } == roll[:score]
end


    # twos - any combo, scores sum of twos
    # threes, fours, fives, sixes
  # lower
    # three of a kind - scores sum of all dice
    # four of a kind - scores sum of all dice
    # full house - scores 25
    # small straight (1,2,3,4) or (2,3,4,5) - scores 30
    # large strate (1,2,3,4,5) - scores 40
    # yahtzee, all dice the same - scores 50
    # chance, any combo - scores sum of all dice

## scoring
  # upper
    # 35 bonus for upper score >= 63
    # scores 0 if dice do not match selected slot
  # lower
    # scores 0 if dice do not match selected slot
end
#
# game = YahtzeeTest.new()
# roll = { dice: [1,1,1,2,3], score: 3 }
# p scorecard_aces(roll)
