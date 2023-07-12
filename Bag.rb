require './RandomizerContainer'
require './Hand.rb'

class Bag < RandomizerContainer
  def empty()
    hand = Hand.new()
    hand.move_all(self)
    return hand
  end

  def move_all(rc)
    if rc.is_a?(RandomizerContainer)
      rc.reset_all()
      super
    end
  end

  def store(r)
    if r.is_a?(Randomizer)
      r.reset()
      super
    end
  end
end