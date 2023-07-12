require './RandomizerContainer'
require './Results.rb'

class Player
  def initialize(name)
    @name = name.to_s
    @bag = Bag.new
    @cup = Cup.new
    @results = Array.new
  end

  def name()
    return @name
  end

  def store(item)
    if !item.is_a?(Randomizer)
      return self
    end
    @bag.store(item)
    return self
  end

  def move_all(rc)
    if !rc.is_a?(RandomizerContainer)
      return self
    end
    @bag.move_all(rc)
    return self
  end

  def load (description = { })
    description = check_description(description)
    hand = @bag.select(description)
    @cup.load(hand)
    return self
  end

  def throw()
    result = @cup.throw
    @results.unshift(result)
    return result
  end

  def replace(description = { })
    description = check_description(description)
    hand = @cup.select(description)
    @bag.move_all(hand)
    return self
  end

  def clear()
    @results.clear
    return self
  end

  def tally(description = { })
    description = check_description(description)
    tally_result = Array.new
    @results.each do |result|
      result.description(description)
      tally_result.push(result.tally())
    end
    return tally_result
  end

  def sum(description = { })
    description = check_description(description)
    sum_result = Array.new
    @results.each do |result|
      result.description(description)
      sum_result.push(result.sum())
    end
    return sum_result
  end

  def results(description = { }, throw = 0)
    description = check_description(description)
    result = @results[throw]
    if result != nil
      result.description(description)
      return result.results()
    else
      return nil
    end
  end

  def check_description (description)
    if !description.is_a?(Hash)
      puts "ERROR: given description is not a hash value, using nil description instead"
      return nil
    else
      return description
    end
  end

  def empty()
    hand = @bag.empty()
    hand.empty()
    hand = @cup.empty()
    hand.empty()
    return self
  end
end