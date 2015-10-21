# TODO: If a Leopard stops moving for 3 steps it turns invisible.
class Leopard < Agent
  def next_step(map, position)
    @position = position
    target = find_nearest(Chimp, map)
    if target.present?
      #puts "Leopard moving towards #{target} where direction is #{direction_towards(target)}"
      return position.relative_to(direction_towards(target))
    else
      return position.relative_to(Direction.random)
    end
  end

  def to_s
    "😸".red
  end
end
