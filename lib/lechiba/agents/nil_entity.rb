class NilEntity < Agent
  def initialize(msg)
    @msg = msg
    @position = NilPosition.new(-1, -1)
  end

  def present?
    false
  end

  def to_s
    "<NilEntity @msg=\"#{@msg}\">"
  end
end
