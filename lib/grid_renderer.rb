class GridRenderer
  attr_reader :output
  SPRITES = { :alive => "O", :dead => " " }

  def initialize(output)
    @output = output
  end

  def render(grid)
    output.clear

    0.upto(grid.max_index(:height)) do |y|
      line = ""
      0.upto(grid.max_index(:width)) do |x|
        line += SPRITES[grid.cell_at(x, y)]
      end
      output.puts(line)
    end
  end
end