require 'spec_helper'

describe "Board" do
	it "should exist" do
		expect(Board.new()).to be
	end

	it "should be able to create from string" do
		board = Board.create_from_string "C B"
		expect(board.to_s).to eql("[C][ ][B]")
	end

	it "should interpret the chars in strin" do
		board = Board.create_from_string "CBL"
		expect(board.all_known(Chimp).count).to eql 1
		expect(board.all_known(Banana).count).to eql 1
		expect(board.all_known(Leopard).count).to eql 1
	end
end