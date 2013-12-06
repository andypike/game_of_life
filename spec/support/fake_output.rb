class FakeOutput
  attr_reader :lines

  def initialize
    @lines = []
  end

  def puts(line)
    lines << line
  end

  def clear
  end
end