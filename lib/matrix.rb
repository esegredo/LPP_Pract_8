require 'fraction'

class Matrix
  attr_reader :numberRows
  attr_reader :numberColumns

  def initialize(*args)
	  raise IndexError unless ((args[0] > 0) && (args[1] > 0))
    @numberRows = args[0]
    @numberColumns = args[1]
    @data = Array.new(@numberRows, Array.new(@numberColumns, args[2])) if (args.size == 3)
    @data = Array.new(@numberRows, Array.new(@numberColumns)) if (args.size == 2)
  end
	
	def [] (index)
		@data[index]
	end

	def == (m)
		raise IndexError unless ((@numberRows == m.numberRows) && (@numberColumns == m.numberColumns))
		for i in (0 ... @numberRows)
			for j in (0 ... @numberColumns)
				return false if (self[i][j] != m[i][j])
			end
		end
		return true
	end

	def + (m)
		raise IndexError unless ((@numberRows == m.numberRows) && (@numberColumns == m.numberColumns))
		result = Matrix.new(@numberRows, @numberColumns)
		for i in (0 ... @numberRows)
			for j in (0 ... @numberColumns)
				result[i][j] = self[i][j] + m[i][j]
			end
		end
		return result
	end

end
