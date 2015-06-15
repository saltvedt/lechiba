class Leopard < Agent

  # TODO: move randomly for X steps, hide for Y, be invsible after Z
  def next_step(map)
    target = find_nearest(Chimp, map)
    if target.present?
      puts "Leopard moving towards #{target} where direction is #{direction_towards(target)}"
      return self.class.new(position.relative_to(direction_towards(target)))
    else
      return self.class.new(position.relative_to(Direction.random))
    end
  end

  def to_s
    "😸".red
  end
end