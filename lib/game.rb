class Game
  attr_reader :grid, :renderer

  def initialize(output = TerminalOutput.new)
    @renderer = GridRenderer.new(output)
  end

  def new_game(starting_grid)
    @grid = starting_grid
    update_display
  end

  def game_over?
    raise "You must supply a starting grid using #new_game" if grid.nil?
    grid.no_alive_cells?
  end

  def run
    until game_over?
      sleep 0.25

      next_grid = Grid.new(grid.width, grid.height)
      next_generation = NextGeneration.new(grid)

      grid.each_cell do |x, y|
        next_state = next_generation.destiny(x, y)
        next_grid.change_cell(x, y, to: next_state)
      end

      @grid = next_grid

      update_display
    end
  end

  private

    def update_display
      renderer.render(grid)
    end
end
