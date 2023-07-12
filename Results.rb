require './RandomizerContainer'

class Results
  def initialize(cup)
    @descriptions = nil
    if cup.is_a?(Cup)
      @cup = clone_cup(cup)
    else
      puts "ERROR: given cup is not a Cup object"
      @cup = nil
    end
  end

  def description(description)
    @descriptions = check_description(description)
  end

  def check_description (description)
    if !description.is_a?(Hash)
      puts "ERROR: given description is not a hash value, using nil description instead"
      return nil
    else
      return description
    end
  end

  def results()
    if @descriptions == nil || @descriptions.empty?
      return @cup.get_all_results()
    else
      hand = @cup.select(@descriptions)
      results = hand.get_all_results()
      @cup.load(hand)
      return results
    end
  end

  def tally()
    if @descriptions == nil || @descriptions.empty?
      return @cup.tally_all()
    else
      hand = @cup.select(@descriptions)
      tally = hand.tally_all()
      @cup.load(hand)
      return tally
    end
  end

  def sum()
    if @descriptions == nil || @descriptions.empty?
      return @cup.sum_all()
    else
      hand = @cup.select(@descriptions)
      sum = hand.sum_all()
      @cup.load(hand)
      return sum
    end
  end

  def clone_cup(cup)
    randomizers = Array.new
    cup.get_all().clone.each do |randomizer|
      randomizers.push(randomizer.clone)
    end
    new_cup = Cup.new
    new_cup.store_all(randomizers)
    return new_cup
  end
end