require_relative 'lechiba/position'
require_relative 'lechiba/direction'
require_relative 'lechiba/board'
require_relative 'lechiba/agent'
require_relative 'lechiba/agents/empty_cell'
require_relative 'lechiba/agents/banana'
require_relative 'lechiba/agents/leopard'
require_relative 'lechiba/agents/chimp'
require_relative 'lechiba/agents/nil_entity'

class Lechiba
  def initialize
    @board = Board.new(20)
    place_entities_on_grid
  end

  def place_entities_on_grid
    @board.place(Banana.new(Position.new(5,5)))
    @board.place(Leopard.new(Position.new(6,4)))
    @board.place(Chimp.new(Position.new(2,4)))
  end

  def run_game
    loop do 
      puts @board.to_s
      @board.step!
      break if gets.strip != ""
    end
  end
end

if __FILE__==$0
  game = Lechiba.new()
  game.run_game
end
