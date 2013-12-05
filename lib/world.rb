class World
  attr_reader :grid

  def initialize(width, height)
    @grid = Grid.new(width, height)
  end

  def new_game(num_of_live_cells)
    @grid.seed(num_of_live_cells)
  end
end
