require 'multidimensionalarray'
require 'fraction'

describe MultidimensionalArray do
  before :all do
	  @integer_obj = MultidimensionalArray.new(1,2,3)
    for i in 0...1
  	  for j in 0...2
  		  for k in 0...3
  			  @integer_obj[i,j,k] = i + j + k
  			end
  	  end
  	end

	  @rational_obj = MultidimensionalArray.new(1,2,3)
    for i in 0...1
  	  for j in 0...2
  		  for k in 0...3
  			  @rational_obj[i,j,k] = Fraction.new(1, i + j + k + 1)
  			end
  	  end
  	end
  end
  
  it "Se debe poder crear un array multidimensonal de Enteros" do
    for i in 0...1
  	  for j in 0...2
  		  for k in 0...3
  			  (@integer_obj[i,j,k]).is_a?(Fixnum).should == true 
  			end
  	  end
  	end
  end

  it "Se debe poder crear un array multidimensonal de Racionales" do
    for i in 0...1
  	  for j in 0...2
  		  for k in 0...3
  			  (@rational_obj[i,j,k]).is_a?(Fraction).should == true 
  			end
  	  end
  	end
  end

end


