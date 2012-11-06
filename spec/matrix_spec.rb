require 'matrix'

describe Matrix do
	
	before :each do
	end

	it "Las dimensiones de la matriz deben ser mayores que cero" do
		expect {Matrix.new(0, 1)}.to raise_error(IndexError)
		expect {Matrix.new(0, 1, 20)}.to raise_error(IndexError)
		expect {Matrix.new(-1, 4)}.to raise_error(IndexError)
		expect {Matrix.new(-1, 4, 17)}.to raise_error(IndexError)
		expect {Matrix.new(1, 0, Fraction.new(0, 1))}.to raise_error(IndexError)
		expect {Matrix.new(1, 1, Fraction.new(1, 0))}.to raise_error(TypeError)
	end

	it "Se debe poder sumar dos matrices de Enteros" do
		(Matrix.new(3, 2, 4) + Matrix.new(3, 2, 1)).should == Matrix.new(3, 2, 5)
		(Matrix.new(4, 7, -3) + Matrix.new(4, 7, -4)).should == Matrix.new(4, 7, -7)
		(Matrix.new(20, 43, -1) + Matrix.new(20, 43, 5)).should == Matrix.new(20, 43, 4)
		(Matrix.new(12, 10, 1) + Matrix.new(12, 10, 21)).should_not == Matrix.new(12, 10, 19)
		expect {Matrix.new(5, 8, -1) + Matrix.new(8, 5, 5)}.to raise_error(IndexError)
		expect {(Matrix.new(5, 8, -1) + Matrix.new(5, 8, 5)) == Matrix.new(8, 5, 4)}.to raise_error(IndexError)
	end

	it "Se debe poder sumar dos matrices de Racionales" do
		(Matrix.new(3, 2, Fraction.new(1, 2)) + Matrix.new(3, 2, Fraction.new(1, 6))).should == Matrix.new(3, 2, Fraction.new(8, 12))
		(Matrix.new(4, 7, Fraction.new(-3, 4)) + Matrix.new(4, 7, Fraction.new(-4, 2))).should == Matrix.new(4, 7, Fraction.new(-22, 8))
		(Matrix.new(20, 43, Fraction.new(-1, 2)) + Matrix.new(20, 43, Fraction.new(8, 4))).should == Matrix.new(20, 43, Fraction.new(12, 8))
		(Matrix.new(12, 10, Fraction.new(1, 2)) + Matrix.new(12, 10, Fraction.new(1, 2))).should_not == Matrix.new(12, 10, Fraction.new(1, 3))
		expect {Matrix.new(5, 8, Fraction.new(-1, 2)) + Matrix.new(8, 5, Fraction.new(5, 2))}.to raise_error(IndexError)
		expect {(Matrix.new(5, 8, Fraction.new(-1, 2)) + Matrix.new(5, 8, Fraction.new(5, 2))) == Matrix.new(8, 5, Fraction.new(4, 7))}.to raise_error(IndexError)
	end

	it "Se debe poder multiplicar dos matrices de Enteros" do
		(Matrix.new(3, 2, 2) * Matrix.new(2, 3, 3)).should == Matrix.new(3, 3, 12)
		(Matrix.new(3, 2, 7) * Matrix.new(2, 4, 3)).should == Matrix.new(3, 4, 42)
		expect {Matrix.new(3, 2, 7) * Matrix.new(3, 4, 3)}.to raise_error(IndexError)
	end

	it "Se debe poder multiplicar dos matrices de Racionales" do
		(Matrix.new(3, 2, Fraction.new(1, 2)) * Matrix.new(2, 3, Fraction.new(3, 5))).should == Matrix.new(3, 3, Fraction.new(6, 10))
		(Matrix.new(3, 2, Fraction.new(3, 5)) * Matrix.new(2, 4, Fraction.new(7, 6))).should == Matrix.new(3, 4, Fraction.new(42, 30))
		expect {Matrix.new(3, 2, Fraction.new(3, 5)) * Matrix.new(4, 4, Fraction.new(7, 6))}.to raise_error(IndexError)
	end

end
