class Roll
  def initialize
    @dice = Array.new(5) { Math.floor(rand(1..6)) }
  end

  def get_sets
    results = {}
    @dice.each { |die| results[die] = results[die] ? results[die] + 1 : 1 }
    results
  end

  def validate_straight(len)
    nums = get_sets.keys.sort { |a, b| a <=> b }
    idx = 0

    while idx < len
      if nums[idx] != nums[idx + 1] - 1
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
