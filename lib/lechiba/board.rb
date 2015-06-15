class Board

  ENTITY_CHARS = {
    "C" => Chimp,
    "B" => Banana,
    "L" => Leopard
  }

  def self.char_to_entity(char)
    entity = ENTITY_CHARS[char] || EmptyCell
  end

  def self.create_from_string(string)
    line = string.split("")
    interpreted_line = line.map { |char| char_to_entity(char) }

    # WIP! Try something like this, except with index?
    #interpreted_line = line.map { |char| char_to_entity(char).new(Position.new(0,1)) }

    neg = Array.new(1) { Array.new(string.size) }
    neg.each_with_index do |row, x|
      row.each_with_index do |cell, y|
        neg[x][y] = EmptyCell.new(Position.new(x, y))
      end
    end

    grid = [interpreted_line]

    Board.new(grid.size, grid)
  end

  def self.new_empty_grid(size)
    neg = Array.new(size) { Array.new(size) }
    neg.each_with_index do |row, x|
      row.each_with_index do |cell, y|
        neg[x][y] = EmptyCell.new(Position.new(x, y))
      end
    end

    return neg
  end

  attr_reader :grid

  def initialize(size = 20, grid = nil)
    @grid = grid || Board.new_empty_grid(size)
    @step_count  = 0
  end

  def place!(entity)
    x = entity.position.x
    y = entity.position.y
    @grid[x][y] = entity
  end

  def strip_agent_internals
    grid.deep_map do |cell|
      cell.class
    end
  end

  def step!
    new_grid = Board.new_empty_grid(grid.size)
    
    grid.each_with_index do |row, x|
      row.each_with_index do |cell, y|

        new_entitiy_of_cell = cell.next_step(self.dup)
        
        # TODO: validate that position of new entitiy is legal 
        
        x = new_entitiy_of_cell.position.x
        y = new_entitiy_of_cell.position.y
        
        new_grid[x][y] = new_entitiy_of_cell
      end
    end
  
    @grid = new_grid
  end

  def all_known(entity_type)
    grid.flatten.select { |e| e.instance_of? (entity_type) }
  end

  def to_s
    grid.map do |row|
      row.map do |cell|
        "[#{cell}]"
      end.join
    end.join("\n")
  end
end

