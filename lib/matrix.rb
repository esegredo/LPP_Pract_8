require 'multidimensionalarray'
require 'fraction'

class Matrix
  attr_reader :numberOfRows
  attr_reader :numberOfColumns

  def initialize(numberOfRows, numberOfColumns)
	  raise IndexError if numberOfRows <= 0 and numberOfColumns <= 0 
    @numberOfRows = numberOfRows
    @numberOfColumns = numberOfColumns
    @array = MultidimensionalArray.new(numberOfRows, numberOfColumns)
  end

  def [](i, j)
    @array[i,j]
  end

  def []=(i, j, value)
    @array[i,j] = value
  end

  def *(mat)
	  raise IndexError unless @numberOfColumns == mat.numberOfRows
    result = Matrix.new(@numberOfRows, mat.numberOfColumns)
    for i in 0 ... @numberOfRows
      for j in 0 ... mat.numberOfColumns
        sum = zero
        for k in 0 ... @numberOfColumns
          sum += self[i,k] * mat[k,j]
        end
        result[i,j] = sum
      end
    end
    return result
  end

	def to_s
	 "#{self.class} - #{@array}"
	end

	def zero
	  raise "The zero must be defined for each team"
	end

	def ==(other)
	  if other.is_a? Matrix
		  if @numberOfRows == other.numberOfRows && @numberOfColumns == other.numberOfColumns
			  res = true
        for i in 0 ... @numberOfRows
          for j in 0 ... @numberOfColumns
            res = res && (self[i,j] == other [i,j])
          end
        end
      else
			  false
		  end
		else
		  false
		end
	end

end


class FractionMatrix < Matrix
  def zero
	  Fraction.new(0,1)
	end
end

class IntegerMatrix < Matrix
  def zero
	  0
	end
end
