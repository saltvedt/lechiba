require 'spec_helper'

describe "Position" do
  it "should point in the right direction" do
    top_left = Position.new(0,0)
    bottom_right = Position.new(2,2)
    direction = top_left.direction_towards(bottom_right)
    expect(direction).to eql(Direction.new(1,1))
  end

  it "should have positions relative to direction" do
	middle = Position.new(1,1)
	direction_down_right = Direction.new(1,1)
	expect(middle.relative_to(direction_down_right)).to eql(Position.new(2,2))
  end
end