class Grid
  attr_reader :width, :height, :cells

  def initialize(width, height)
    validate_dimension(width)
    validate_dimension(height)

    @width = width
    @height = height
    @cells = Hash.new(:dead)
  end

  def seed(num_of_live_cells)
    1.upto num_of_live_cells do
      cells[random_dead_cell] = :alive
    end
  end

  def cell_at(x, y)
    cells[ [x, y] ]
  end

  def count_cells
    counts = Hash.new(0)

    0.upto max_index(:width) do |x|
      0.upto max_index(:height) do |y|
        counts[cell_at(x, y)] += 1
      end
    end

    counts
  end

  private

    def max_index(dimension)
      public_send(dimension) - 1
    end

    def validate_dimension(size)
      raise "Dimensions must be greater than zero" if size.to_i < 1
    end

    def random_dead_cell
      begin
        x = rand max_index(:width)
        y = rand max_index(:height)
      end while cell_at(x, y) == :alive

      [x, y]
    end
end