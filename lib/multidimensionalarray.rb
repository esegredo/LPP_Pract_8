class MultidimensionalArray
  def initialize(*dimensions)
	  @dimensions = Array.new(dimensions.length)
		@factors = Array.new(dimensions.length)
    product = 1
    i = dimensions.length - 1
    while i >= 0
      @dimensions[i] = dimensions[i]
      @factors[i] = product
      product *= @dimensions[i]
      i -= 1
    end
    @data = Array.new(product)
	end

	def to_s
	  "#{self.class} #{@dimensions} - #{@factors} - #{@data}"
	end

  def getOffset(indices)
    raise IndexError if indices.length != @dimensions.length
    offset = 0
    for i in 0 ... @dimensions.length
      if indices[i] < 0 or indices[i] >= @dimensions[i]
        raise IndexError
      end
      offset += @factors[i] * indices[i]
    end
    return offset
  end

  def [](*indices)
    @data[self.getOffset(indices)]
  end

  def []=(*indicesAndValue)
    value = indicesAndValue.pop
    @data[self.getOffset(indicesAndValue)] = value
  end
end
