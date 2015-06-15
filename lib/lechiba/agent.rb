class Agent
  attr_accessor :position

  def initialize(position)
    @position = position
  end

  def present?
    true
  end

  def find_nearest(entity_type, board)
    nearest = board.all_known(entity_type).sort_by { |entity| distance_to(entity) }.first
    nearest || NilEntity.new("No entities of type #{entity_type} found")
  end
  
  def distance_to(entity)
    position.distance_to(entity.position)
  end

  def direction_towards(entity)
    position.direction_towards(entity.position)
  end

  def direction_away_from(entity)
    direction_towards(entity).reverse
  end

  def to_s
    self.class.name[0]
  end

  def next_step(map)
    self
  end

  def empty?
    false
  end
end
