require './RandomizerContainer'
require './Randomizer'

class Hand < RandomizerContainer
  def next()
    if @randomizers.empty?
      return nil
    else
      return @randomizers.pop
    end
  end

  def empty()
    clear_container()
    return nil
  end
end