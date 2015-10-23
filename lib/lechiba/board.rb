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
    @clean_grid = true
    @step_count  = 0
  end

  def place!(entity)
    x = entity.position.x
    y = entity.position.y
    @grid[x][y] = entity
  end

  def out_of_range?(x, y)
    max_index = grid.size - 1
    x_oor = x > max_index || x < 0 
    y_oor = y > max_index || y < 0
    x_oor || y_oor 
  end

  def step!
    agents = all_known(Banana) + all_known(Chimp) + all_known(Leopard)

    new_grid = grid.dup
    agents.each do |agent|
      x = agent.position.x
      y = agent.position.y

      # TODO! Dont get position from the board, not the agent

      new_position_of_agent = agent.next_step(self.dup, Position.new(x,y))

      new_x = new_position_of_agent.x
      new_y = new_position_of_agent.y

      out_of_range = out_of_range?(new_x, new_y)

      if not out_of_range and new_grid[new_x][new_y].empty?                    
        new_grid[new_x][new_y] = agent.set_position!(Position.new(new_x, new_y))
        new_grid[x][y] = EmptyCell.new(Position.new(x, y))
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
        if @clean_grid
          "#{cell}"
        else
          "[#{cell}]"
        end
      end.join
    end.join("\n")
  end
end
