require 'spec_helper'

describe "Board" do
  it "should exist" do
    expect(Board.new()).to be
  end

  it "#all_known" do
    board = Board.new(20)
    board.place!(Banana.new(Position.new(5,5)))
    expect(board.all_known(Banana).count).to eql 1
  end

  describe ".create_from_string" do
    it "should be able to create from string" do
      board = Board.create_from_string "C B"
      expect(board.to_s).to eql("[Chimp][EmptyCell][Banana]")
    end

    pending "should interpret the chars in string" do
      board = Board.create_from_string "CBL"
      expect(board.all_known(Chimp).count).to eql 1
      expect(board.all_known(Banana).count).to eql 1
      expect(board.all_known(Leopard).count).to eql 1
    end
  end   

  describe ".new_empty_grid" do
    it "should return an 5x5 grid when given size 5" do
      grid = Board.new_empty_grid(5)
      expect(grid.size).to eql 5
      grid.each do |row|
        expect(row.size).to eql 5
        expect(row).to be_instance_of Array
        row.each do |cell|
          expect(cell).to be_instance_of EmptyCell
        end
      end
    end
  end
end