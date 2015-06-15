class Position
  attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def distance_to(position)
    Math.hypot(position.x - @x, position.y - @y)
  end

  def relative_to(direction)
    Position.new(x + direction.x, y + direction.y)
  end

  def direction_towards(position)
    dir_x = if x > position.x
          1
        elsif x == position.x
          0
        else
          -1
        end

    dir_y = if y > position.y
          1
        elsif y == position.y
          0
        else
          -1
        end

    return Direction.new(dir_x, dir_y)
  end

end