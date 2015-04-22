class NilEntity
  def initialize(msg)
    @msg = msg
  end

  def present?
    false
  end

  def to_s
    inspect
  end
end