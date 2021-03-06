# TODO: Chimps can send "shout" to broadcast massages about the position of entities to every chimp on the board
class Chimp < Agent
  def next_step(map, position)
    @position = position
    target = find_nearest(Banana, map)
    enemy = find_nearest(Leopard, map)
    if enemy.present? and close_to? (enemy)
      #puts "Chimp moving away from #{enemy} where direction is #{direction_away_from(enemy)}"
      return position.relative_to(direction_away_from(enemy))
    else
      if target.present?
        #puts "Chimp moving towards #{target} where direction is #{direction_towards(target)}"
        return position.relative_to(direction_towards(target))
      else
        return position.relative_to(Direction.random)
      end
    end
  end

  def to_s
    "🐵".green
  end

  private

  def close_to? (entity)
    considered_close_if_within = 2
    return distance_to(entity) < considered_close_if_within
  end
end
