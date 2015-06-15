class Direction

  def self.random
    Direction.new(rand(-1..1), rand(-1..1))
  end

  attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def reverse
    Direction.new(x * -1, y * -1)
  end

  def to_s
    "[#{x}, #{y}]"
  end

  def eql?(another_direction)
    another_direction.x == x && another_direction.y == y
  end
end