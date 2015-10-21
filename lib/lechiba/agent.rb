# TODO: Agents have "sight-range"
# TODO: Agents cannot walk off the edge of the universe
# TODO: Agents cannot overwrite other entities except L > C > B
class Agent
  attr_accessor :position

  def initialize(position)
    @position = position
  end

  def set_position! (position)
    @position = position
    self
  end

  def present?
    true
  end

  def find_nearest(entity_type, board)
    nearest = board.all_known(entity_type).sort_by { |entity| distance_to(entity) }.first
    nearest || NilEntity.new("No entities of type #{entity_type} found")
  end
  
  def distance_to(entity)
    raise ArgumentError.new("Given entity (#{entity}) cannot be nil") if entity.nil?
    position.distance_to(entity.position)
  end

  def direction_towards(entity)
    raise ArgumentError.new("Given entity (#{entity}) cannot be nil") if entity.nil?
    position.direction_towards(entity.position)
  end

  def direction_away_from(entity)
    raise ArgumentError.new("Given entity (#{entity}) cannot be nil") if entity.nil?
    direction_towards(entity).reverse
  end

  def to_s
    self.class.name[0]
  end

  def next_step(map, position)
    @position = position
    position
  end

  def empty?
    false
  end
end
