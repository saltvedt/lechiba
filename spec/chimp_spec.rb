require 'spec_helper'

describe "Chimp" do
  pending "should move towards bananas" do
    board = Board.create_from_string "C B"
    board.step!
    expect(board.to_s).to eql(" CB")
  end

  pending "should flee from leopards" do
    board = Board.create_from_string "L C "
    board.step!
    expect(board.to_s).to eql(" L C")
  end

  pending "should be able to eat bananas" do
  	board = Board.create_from_string "CB "
  	board.step!
  	expect(board.to_s).to eql(" C ")
  	#expect numbers of bananas eaten by chimp to be 1
  end
end