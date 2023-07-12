require './Randomizer.rb'

class Coin < Randomizer
  def initialize(denomination)
    @item = :"coin"
    @sides = 2
    @denomination = denomination
  end

  def denomination()
    return @denomination
  end

  def flip()
    randomize()
    return self
  end

  def sideup()
    return result()
  end

  def side_to_int()
    result = 0
    if sideup() == :H
      result = 1
    elsif sideup() == :T
      result = 0
    end
    return result
  end
end