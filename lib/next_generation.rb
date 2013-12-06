class NextGeneration
  attr_reader :cell_counter, :grid

  def initialize(grid, cell_counter_class = CellCounter)
    @grid = grid
    @cell_counter = cell_counter_class.new(grid)
  end

  def destiny(x, y)
    neighbouring_cells = cell_counter.neighbours_of(x, y)

    return :alive if grid.cell_at(x, y) == :alive && neighbouring_cells[:alive] == 2
    return :alive if neighbouring_cells[:alive] == 3

    :dead
  end
end