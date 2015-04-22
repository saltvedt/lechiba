class Leopard < Agent

  # TODO: move randomly for X steps, hide for Y, be invsible after Z
  def next_step(map)
    target = find_nearest(Chimp, map)
    puts "Leopard moving towards #{target} where direction is #{direction_towards(target)}"
    return self.class.new(pos.relative_to(direction_towards(target)))
    #return [rand(-1..1), rand(-1..1)]
  end
end