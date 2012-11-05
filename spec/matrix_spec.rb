require 'matrix'

describe Matrix do
	
	before :each do
	end

	it "Las dimensiones de la matriz deben ser mayores que cero" do
		expect {Matrix.new(0, 1)}.to raise_error(IndexError)
		expect {Matrix.new(0, 1, 20)}.to raise_error(IndexError)
		expect {Matrix.new(-1, 4)}.to raise_error(IndexError)
		expect {Matrix.new(-1, 4, 17)}.to raise_error(IndexError)
	end

	it "Se debe poder sumar dos matrices de enteros" do
		(Matrix.new(3, 2, 4) + Matrix.new(3, 2, 1)).should == Matrix.new(3, 2, 5)
		(Matrix.new(4, 7, -3) + Matrix.new(4, 7, -4)).should == Matrix.new(4, 7, -7)
		(Matrix.new(20, 43, -1) + Matrix.new(20, 43, 5)).should == Matrix.new(20, 43, 4)
		(Matrix.new(12, 10, 1) + Matrix.new(12, 10, 21)).should_not == Matrix.new(12, 10, 19)
		expect {Matrix.new(5, 8, -1) + Matrix.new(8, 5, 5)}.to raise_error(IndexError)
		expect {(Matrix.new(5, 8, -1) + Matrix.new(5, 8, 5)) == Matrix.new(8, 5, 4)}.to raise_error(IndexError)
	end

	it "Se debe poder sumar dos matrices de racionales" do
		(Matrix.new(3, 2, Fraction.new(1, 2)) + Matrix.new(3, 2, Fraction.new(1, 6))).should == Matrix.new(3, 2, Fraction.new(8, 12))
	end

end
