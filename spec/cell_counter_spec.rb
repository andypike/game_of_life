require "spec_helper"

describe CellCounter do
  describe "#neighbours_of" do
    let(:grid) { Grid.new(3, 3) }
    subject(:counter) { CellCounter.new(grid) }

    before do
      grid.cells[ [0, 0] ] = :alive   # OXX
      grid.cells[ [2, 1] ] = :alive   # XXO
      grid.cells[ [1, 2] ] = :alive   # XOX
    end

    it "counts neighbours of a cell not on an edge" do
      expect(counter.neighbours_of(1, 1)).to eq(:alive => 3, :dead => 5)
    end

    it "counts neighbours of a cell on the top edge" do
      expect(counter.neighbours_of(1, 0)).to eq(:alive => 2, :dead => 3, :outside => 3)
    end

    it "counts neighbours of a cell on the right edge" do
      expect(counter.neighbours_of(2, 1)).to eq(:alive => 1, :dead => 4, :outside => 3)
    end

    it "counts neighbours of a cell on the bottom edge" do
      expect(counter.neighbours_of(1, 2)).to eq(:alive => 1, :dead => 4, :outside => 3)
    end

    it "counts neighbours of a cell on the left edge" do
      expect(counter.neighbours_of(0, 1)).to eq(:alive => 2, :dead => 3, :outside => 3)
    end
  end
end
