require "spec_helper"

describe NextGeneration do
  describe "#destiny" do
    let(:grid) { Grid.new(3, 3) }
    subject(:next_generation) { NextGeneration.new(grid) }

    context "when a cell has fewer than 2 live neighbours" do
      it "kills a live cell" do
        grid.cells[ [0, 0] ] = :alive   # OXX
        grid.cells[ [2, 1] ] = :alive   # XXO
        grid.cells[ [1, 2] ] = :alive   # XOX

        expect(next_generation.destiny(1, 2)).to eq(:dead)
      end

      it "keeps a dead cell dead" do
        expect(next_generation.destiny(1, 1)).to eq(:dead)
      end
    end

    context "when a cell has exactly 2 live neighbours" do
      it "keeps a live cell alive" do
        grid.cells[ [1, 0] ] = :alive   # XOX
        grid.cells[ [2, 1] ] = :alive   # XXO
        grid.cells[ [1, 2] ] = :alive   # XOX

        expect(next_generation.destiny(2, 1)).to eq(:alive)
      end

      it "keeps a dead cell dead" do
        grid.cells[ [1, 0] ] = :alive   # XOX
        grid.cells[ [2, 1] ] = :alive   # XXO
        grid.cells[ [1, 2] ] = :alive   # XOX

        expect(next_generation.destiny(0, 1)).to eq(:dead)
      end
    end

    context "when a cell has exactly 3 live neighbours" do
      it "keeps a live cell alive" do
        grid.cells[ [1, 0] ] = :alive   # XOX
        grid.cells[ [1, 1] ] = :alive   # XOO
        grid.cells[ [2, 1] ] = :alive   # XOX
        grid.cells[ [1, 2] ] = :alive

        expect(next_generation.destiny(1, 1)).to eq(:alive)
      end

      it "brings a dead cell to life" do
        grid.cells[ [1, 0] ] = :alive   # XOX
        grid.cells[ [2, 1] ] = :alive   # XXO
        grid.cells[ [1, 2] ] = :alive   # XOX

        expect(next_generation.destiny(1, 1)).to eq(:alive)
      end
    end

    context "when a cell has more than 3 live neighbours" do
      it "kills a live cell" do
        grid.cells[ [1, 0] ] = :alive   # XOX
        grid.cells[ [1, 1] ] = :alive   # XOO
        grid.cells[ [2, 1] ] = :alive   # XOO
        grid.cells[ [1, 2] ] = :alive
        grid.cells[ [2, 2] ] = :alive

        expect(next_generation.destiny(1, 1)).to eq(:dead)
      end

      it "keeps a dead cell dead" do
        grid.cells[ [1, 0] ] = :alive   # XOX
        grid.cells[ [2, 1] ] = :alive   # XXO
        grid.cells[ [1, 2] ] = :alive   # XOO
        grid.cells[ [2, 2] ] = :alive

        expect(next_generation.destiny(1, 1)).to eq(:dead)
      end
    end
  end
end