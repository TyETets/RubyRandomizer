require './RandomizerContainer'
require './Results'

class Cup < RandomizerContainer
  def throw()
    @randomizers.each do |randomizer|
      randomizer.randomize()
    end
    @results = Results.new(self)
    return @results
  end

  def load(hand)
    if hand.is_a?(Hand)
      move_all(hand)
    else
      puts "ERROR: given hand is not a Hand object"
    end
  end

  def empty()
    hand = Hand.new()
    hand.move_all(self)
    return hand
  end
end