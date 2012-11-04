require 'fraction'

describe Fraction do
  before :each do
    @frac_obj_1 = Fraction.new(0,1)
    @frac_obj_2 = Fraction.new(2,4)
  end

  it "Debe existir un numerador" do
    @frac_obj_1.num.should == 0 
  end

  it "Debe existir un denominador" do
    @frac_obj_1.denom.should == 1 
  end

  it "Debe de estar en su forma reducida" do
		@frac_obj_2.num.should == 1
		@frac_obj_2.denom.should == 2
  end

  it "Se debe invocar al metodo num() para obtener el numerador" do
    @frac_obj_1.num.should == 0
  end

  it "Se debe invocar al metodo denom() para obtener el denominador" do
    @frac_obj_1.denom.should == 1
  end

  it "Se debe mostar por la consola la fraccion de la forma: a/b, donde a es el numerador y b el denominador " do
	  @frac_obj_1.to_s.should == "Fraction 0/1"
  end

  it "Se debe mostar por la consola la fraccion en formato flotante" do
	  @frac_obj_1.to_f.should == (0/1) 
	  @frac_obj_2.to_f.should == (1/2) 
  end

  it "Se debe comparar si dos fracciones son iguales con == " do
     @frac_obj_1.should == Fraction.new(0, 1)
  end

  it "Se debe calcular el valor absoluto de una fraccion con el metodo abs" do
     negative = Fraction.new(-3,4) 
     negative.abs.should == Fraction.new(3, 4)
  end

  it "Se debe calcular el reciproco de una fraccion con el metodo reciprocal" do
     negative = Fraction.new(3,4) 
     negative.reciprocal.should == Fraction.new(4, 3)
  end

  it "Se debe calcular el opuesto de una fraccion con -" do
     negativo = - @frac_obj_2
     negativo.should == Fraction.new(-1,2)
  end

  it "Se debe sumar dos fracciones con + y dar el resultado de forma reducida" do
     result = @frac_obj_1 + @frac_obj_2
     result.should == Fraction.new(0*2 + 1*1, 1*2)
  end

  it "Se debe restar dos fracciones con - y dar el resultado de forma reducida" do
     result = @frac_obj_1 - @frac_obj_2
     result.should == Fraction.new(-1, 2)
  end

  it "Se debe multiplicar dos fracciones con * y dar el resultado de forma reducida" do
     result = @frac_obj_1 * @frac_obj_2
     result.should == Fraction.new(0, 2)
  end

  it "Se debe dividir dos fracciones con / y dar el resultado de forma reducida" do
     result = @frac_obj_1 / @frac_obj_2
     result.should == Fraction.new(0, 1)
  end

  it "Se debe calcular el resto dos fracciones con % y dar el resultado de forma reducida" do
     result = @frac_obj_1 % @frac_obj_2
     result.should == Fraction.new(0, 1)
  end

  it "Se debe de poder comprobar si una fracion es menor que otra" do
     result = @frac_obj_1 < @frac_obj_2
     result.should == true 
  end

  it "Se debe de poder comprobar si una fracion es mayor que otra" do
     result = @frac_obj_1 > @frac_obj_2
     result.should == false 
  end

  it "Se debe de poder comprobar si una fracion es menor o igual que otra" do
     result = @frac_obj_1 <= @frac_obj_2
     result.should == true 
  end

  it "Se debe de poder comprobar si una fracion es mayor o igual que otra" do
     result = @frac_obj_1 >= @frac_obj_2
     result.should == false 
  end

end
