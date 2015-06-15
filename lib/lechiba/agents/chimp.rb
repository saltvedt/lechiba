class Chimp < Agent
  def next_step(map)
    target = find_nearest(Banana, map)
    enemy = find_nearest(Leopard, map)
    if enemy.present? and close_to? (enemy)
      puts "Chimp moving away from #{enemy} where direction is #{direction_away_from(enemy)}"
      return self.class.new(position.relative_to(direction_away_from(enemy)))
    else
      puts "Chimp moving towards #{target} where direction is #{direction_towards(target)}"
      return self.class.new(position.relative_to(direction_towards(target)))
    end
  end

  private

  def close_to? (entity)
    considered_close_if_within = 2

    return distance_to(entity) < considered_close_if_within
  end
end