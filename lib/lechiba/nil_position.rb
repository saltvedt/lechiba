class NilPosition < Position
  attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def distance_to(position)
    raise "NotImplemented"
  end

  def relative_to(direction)
    raise "NotImplemented"
  end

  def direction_towards(position)
    raise "NotImplemented"
  end

end