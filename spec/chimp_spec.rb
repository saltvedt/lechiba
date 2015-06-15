require 'spec_helper'

describe "Chimp" do
  it "should move towards bananas" do
    board = Board.create_from_string "C B"
    board.step!
    expect(board.to_s).to eql(" CB")
  end
end