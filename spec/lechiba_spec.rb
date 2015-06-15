require 'spec_helper'

describe "Lechiba" do
  it "should exist" do
    expect(Lechiba.new()).to be
  end

  pending "should hunt for chimps" do
    board = Board.create_from_string "L C "
    board.step!
    expect(board.to_s).to eql(" L C")
  end
end