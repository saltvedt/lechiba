class Direction
  attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def reverse
    self.new(x * -1, y * -1)
  end

  def to_s
    "[#{x}, #{y}]"
  end
end