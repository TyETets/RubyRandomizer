require './Randomizer'

class RandomizerContainer
  def initialize()
    @randomizers = Array.new()
  end

  def store(r)
    if !r.is_a?(Randomizer)
      puts 'Given randomizer is not a Randomizer object'
      return self
    end
    if @randomizers.include?(r) == false
      @randomizers.push(r)
    else
      puts "Randomizer already exists in container!"
    end
    return self
  end

  def store_all(l)
    if !l.empty? && l != nil
      @randomizers.concat(l)
    else
      puts "Randomizers list is empty."
    end
    return self
  end

  def count()
    @randomizers.count()
  end

  def move_all(rc)
    if !rc.is_a?(RandomizerContainer)
      puts "ERROR: parameter rc is not a RandomizerContainer"
      return self
    end
    @randomizers.concat(rc.get_all())
    rc.clear_container
    return self
  end

  def empty()
    # abstract method, implementation specific to container
  end

  def remove_one(r)
    if r.is_a?(Randomizer)
      @randomizers.delete(r)
    end
    return self
  end

  def remove_list(l)
    l.each do |d|
      remove_one(d)
    end
  end

  def clear_container()
    @randomizers.clear()
  end

  def select(description, amt= :all)
    if !description.is_a?(Hash)
      puts "ERROR: given description is not a hash value, using nil description instead"
      return nil
    end

    result = Array.new
    i = 0

    @randomizers.each do |r|
      if i == amt
        puts "At select limit."
        break
      end

      sliced_hash = r.convert_to_hash.slice(description.keys[0], description.keys[1], description.keys[2], description.keys[3], description.keys[4])

      if sliced_hash == description
        result.push(r)
        i += 1 # if searching for x resulting elements
      end
    end

    remove_list(result)

    hand = Hand.new()
    if result != nil && result.length > 0
      hand.store_all(result)
    end

    return hand
  end

  def get_all()
    return @randomizers
  end

  def reset_all() # not sure if this should be here
    @randomizers.each do |randomizer|
      randomizer.reset()
    end
  end

  def tally_all()
    return @randomizers.count
  end

  def get_all_results()
    results = Array.new
    @randomizers.each do |randomizer|
      results.push(randomizer.result())
    end
    return results
  end

  def sum_all()
    sum = 0
    @randomizers.each do |randomizer|
      result = randomizer.result()
      if result == :H
        result = 1
      elsif result == :T
        result = 0
      end
      sum += result
    end
    return sum
  end
end