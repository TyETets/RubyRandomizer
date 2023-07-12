class Randomizer
  @@randomizer_count = 0

  def randomize()
    if @sides != nil && @sides >= 1
      @up = rand(1..@sides)

      if @item == :"coin"
        if @up == 1
          @up = :H
        elsif @up == 2
          @up = :T
        else
          @up = nil
        end
      end

      @@randomizer_count += 1
    end

    return self
  end

  def result()
    return @up
  end

  def calls()
    return @@randomizer_count
  end

  def reset()
    @@randomizer_count = 0
    @up = nil
    return self
  end

  def convert_to_hash()
    instance_variables.map do |var|
      [var[1..-1].to_sym, instance_variable_get(var)]
    end.to_h
  end
end