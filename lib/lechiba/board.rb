class Board
  attr_reader :grid

  def initialize(size = 20, grid = nil)
    @grid = grid || new_empty_grid(size)
    @step_count  = 0
  end

  def self.create_from_string(string)
    
    line = string.split("")
    interpreted_line = line.map { |char| char_to_entity(char) }
    puts interpreted_line.inspect

    char_grid = [["B", "C"]]

    neg = Array.new(1) { Array.new(string.size) }
    neg.each_with_index do |row, x|
      row.each_with_index do |cell, y|
        neg[x][y] = .new(Position.new(x, y))
      end
    end

    grid = [interpreted_line]

    Board.new(nil, grid)
  end

  def self.char_to_entity(char)
    return Chimp if char == "C"
    return Banana if char == "B"
    return Leopard if char == "L"
    return EmptyCell
  end

  def place(entity)
    x = entity.pos.x
    y = entity.pos.y
    @grid[x][y] = entity
  end

  def step!
    new_grid = new_empty_grid(grid.size)
    
    grid.each_with_index do |row, x|
      row.each_with_index do |cell, y|

        new_entitiy_of_cell = cell.next_step(self.dup)
        
        # TODO: validate that position of new entitiy is legal 
        
        x = new_entitiy_of_cell.pos.x
        y = new_entitiy_of_cell.pos.y
        
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

  private

  def new_empty_grid(size)
    neg = Array.new(size) { Array.new(size) }
    neg.each_with_index do |row, x|
      row.each_with_index do |cell, y|
        neg[x][y] = EmptyCell.new(Position.new(x, y))
      end
    end

    return neg
  end
end