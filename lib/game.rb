class Game
  attr_reader :grid, :renderer

  def initialize(width, height, output = TerminalOutput.new)
    @grid = Grid.new(width, height)
    @renderer = GridRenderer.new(output)
  end

  def new_game(num_of_live_cells)
    grid.seed(num_of_live_cells)
    renderer.render(grid)
  end

  def game_over?
    grid.count_cells[:alive] == 0
  end

  def run
    until game_over?
      sleep 0.25

      next_grid = Grid.new(grid.width, grid.height)
      next_generation = NextGeneration.new(grid)

      0.upto(grid.max_index(:height)) do |y|
        0.upto(grid.max_index(:width)) do |x|
          next_grid.cells[ [x, y] ] = next_generation.destiny(x, y)
        end
      end

      @grid = next_grid

      renderer.render(grid)
    end
  end
end
