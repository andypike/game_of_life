class Grid
  attr_reader :width, :height, :cells

  def initialize(width, height)
    validate_dimension(width)
    validate_dimension(height)

    @width = width
    @height = height
    @cells = Hash.new(:dead)
  end

  def seed(num_of_alive_cells)
    1.upto num_of_alive_cells do
      cells[random_dead_cell] = :alive
    end
  end

  def cell_at(x, y)
    return :outside if outside_grid?(x, y)

    cells[ [x, y] ]
  end

  def change_cell(x, y, to: :alive)
    return if outside_grid?(x, y)

    cells[ [x, y] ] = to
  end

  def each_cell
    each_row do |y|
      each_column do |x|
        yield(x, y)
      end
    end
  end

  def each_row
    0.upto max_index(:height) do |y|
      yield(y)
    end
  end

  def each_column
    0.upto max_index(:width) do |x|
      yield(x)
    end
  end

  def no_alive_cells?
    alive_cells == 0
  end

  def alive_cells
    num_of_cell_that_are :alive
  end

  def dead_cells
    num_of_cell_that_are :dead
  end

  private

    def num_of_cell_that_are(state)
      counter = CellCounter.new(self)
      counter.count_cells[state]
    end

    def max_index(dimension)
      public_send(dimension) - 1
    end

    def outside_grid?(x, y)
      x < 0 || x > max_index(:width) || y < 0 || y > max_index(:height)
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