require 'matrix'
require 'fraction'
require 'multidimensionalarray'

describe MultidimensionalArray do
  before :all do
  	@im = IntegerMatrix.new(3,3)
    for i in 0...@im.numberOfRows
  	  for j in 0...@im.numberOfColumns
  			@im[i,j] = 1 
  	  end
  	end
  	@in = IntegerMatrix.new(3,2)
    for i in 0...@in.numberOfRows
  	  for j in 0...@in.numberOfColumns
  			@in[i,j] = 1 
  	  end
  	end
		@ir = IntegerMatrix.new(3,2)
    for i in 0...@ir.numberOfRows
  	  for j in 0...@ir.numberOfColumns
  			@ir[i,j] = 3 
  	  end
  	end

  	@fm = FractionMatrix.new(3,3)
    for i in 0...@fm.numberOfRows
  	  for j in 0...@fm.numberOfColumns
  			@fm[i,j] = Fraction.new(1, 1) 
  	  end
  	end
  	@fn = FractionMatrix.new(3,2)
    for i in 0...@fn.numberOfRows
  	  for j in 0...@fn.numberOfColumns
  			@fn[i,j] = Fraction.new(1, 1)
  	  end
  	end
		@fr = FractionMatrix.new(3,2)
    for i in 0...@fr.numberOfRows
  	  for j in 0...@fr.numberOfColumns
  			@fr[i,j] = Fraction.new(3, 1)
  	  end
  	end

  end
  
  it "Se debe poder multiplicar una matriz de Enteros" do
	  #@im = [[1,2,3],[4, 5, 6], [7, 8, 9]] 
	  #@in = [[1,1],[1, 1], [1,1]] 
  	#(@im * @in).should == [[6,6], [15,15], [24, 24]] 
	  (@im * @in).should == @ir 
  end

  it "Se debe poder multiplicar dos matrices de Racionales" do
	  (@fm * @fn).should == @fr 
  end

end

