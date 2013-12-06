class CellCounter
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def neighbours_of(x, y)
    neighbours = Hash.new(0)

    left = x - 1
    top = y - 1

    left.upto(left + 2) do |x2|
      top.upto(top + 2) do |y2|
        neighbours[grid.cell_at(x2, y2)] += 1 unless x2 == x && y2 == y
      end
    end

    neighbours
  end
end