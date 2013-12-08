class GridRenderer
  attr_reader :output
  SPRITES = { :alive => "O", :dead => " " }

  def initialize(output)
    @output = output
  end

  def render(grid)
    output.clear

    grid.each_row do |y|
      line = ""
      grid.each_column do |x|
        line += SPRITES[grid.cell_at(x, y)]
      end
      output.puts(line)
    end
  end
end