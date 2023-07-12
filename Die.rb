require './Randomizer.rb'

class Die < Randomizer
  def initialize(sides, colour)
    @item = :"die"
    if sides >= 1
      @sides = sides
    else
      @sides = 1
      # @sides = nil
    end
    @colour = colour
  end

  public def colour()
    return @colour
  end

  public def sides()
    return @sides
  end

  public def roll()
    randomize()
    return self
  end

  public def sideup()
    return result()
  end
end