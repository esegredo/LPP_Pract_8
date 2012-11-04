class Fraction
  include Comparable
  attr_reader :num, :denom

  def gcd(x,y)
    y == 0 ? x: gcd(y, x%y)
  end

  def lcm(x,y)
    z = x / gcd(x,y) * y
  end

  def initialize(num, denom)
    raise TypeError, "Denominator may not be zero" if denom.eql? 0

    d = gcd(num, denom)
    @num = num / d
    @denom =  denom / d
  end  

	def to_s
	  "#{self.class} #@num/#@denom"
	end

	def to_f
	  @num/@denom
	end

	def == (other)
	  @num == other.num && @denom == other.denom
	end
	
	def abs
	  Fraction.new(@num.abs, @denom)
	end

	def reciprocal
	  Fraction.new(@denom, @num)
	end

	def -@
	  Fraction.new(-@num, @denom)
	end

	def +  (other)
	  m = lcm(@denom, other.denom)
		na = @num * m / @denom 
		nb = other.num * m / other.denom 
		Fraction.new( na + nb, m)
	end

	def -(other)
	  self + (-other)	
	end

	def *(other)
		Fraction.new( @num * other.num, @denom * other.denom)
	end

	def /(other)
	  self * other.reciprocal
	end

	def %(other)
	  l = @num * other.denom
		r = @denom * other.num 
		n = l/r 
		Fraction.new( l - n * r, @denom * other.denom)
	end

	def <(other)
	  (@num * other.denom) < (@denom * other.num) 
	end

	def >(other)
	  (@num * other.denom) > (@denom * other.num) 
	end

	def <=(other)
	  (@num * other.denom) <= (@denom * other.num) 
	end

	def >=(other)
	  (@num * other.denom) >= (@denom * other.num) 
	end

	def coerce(other)
	  [self, other]
	end

end
