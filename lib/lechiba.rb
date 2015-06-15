require 'colorize'

require_relative 'lechiba/version'
require_relative 'lechiba/position'
require_relative 'lechiba/direction'
require_relative 'lechiba/agent'
require_relative 'lechiba/agents/empty_cell'
require_relative 'lechiba/agents/banana'
require_relative 'lechiba/agents/leopard'
require_relative 'lechiba/agents/chimp'
require_relative 'lechiba/nil_position'
require_relative 'lechiba/agents/nil_entity'
require_relative 'lechiba/board'

class Lechiba
  def initialize
    @board = Board.new(30)
    chaos_scenario
  end

  def chaos_scenario
    @board.place!(Banana.new(Position.new(1,5)))
    @board.place!(Banana.new(Position.new(7,5)))
    @board.place!(Banana.new(Position.new(11,7)))
    @board.place!(Banana.new(Position.new(15,10)))
    @board.place!(Banana.new(Position.new(15,10)))
    @board.place!(Banana.new(Position.new(24,10)))
    @board.place!(Banana.new(Position.new(25,28)))
    @board.place!(Banana.new(Position.new(29,25)))
    @board.place!(Banana.new(Position.new(21,1)))

    @board.place!(Leopard.new(Position.new(7,7)))

    @board.place!(Chimp.new(Position.new(5,23)))
    @board.place!(Chimp.new(Position.new(22,4)))
  end

  def chimp_paradise
    @board.place!(Banana.new(Position.new(1,5)))
    @board.place!(Banana.new(Position.new(7,5)))
    @board.place!(Banana.new(Position.new(11,7)))
    @board.place!(Banana.new(Position.new(15,10)))
    @board.place!(Banana.new(Position.new(15,10)))
    @board.place!(Banana.new(Position.new(24,10)))
    @board.place!(Banana.new(Position.new(25,28)))
    @board.place!(Banana.new(Position.new(29,25)))
    @board.place!(Banana.new(Position.new(21,1)))
    @board.place!(Chimp.new(Position.new(22,4)))
  end

  def simple_hunting
    @board.place!(Leopard.new(Position.new(25,25)))
    @board.place!(Chimp.new(Position.new(15,24)))
  end

  def run_game
    loop do 
      puts @board.to_s
      puts  "-" * 60
      @board.step!
      break if gets.strip != ""
    end
  end
end

if __FILE__ == $0
  game = Lechiba.new()
  game.run_game
end
