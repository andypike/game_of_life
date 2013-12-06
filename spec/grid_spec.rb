require "spec_helper"

describe Grid do
  describe ".new" do

    context "with valid grid size" do
      subject(:grid) { Grid.new(100, 200) }

      it "sets the width" do
        expect(grid.width).to eq(100)
      end

      it "sets the height" do
        expect(grid.height).to eq(200)
      end
    end

    context "with invalid grid size" do
      it "raises if width is nil" do
        expect{ Grid.new(nil, 200) }.to raise_error
      end

      it "raises if height is nil" do
        expect{ Grid.new(100, nil) }.to raise_error
      end

      it "raises if width is zero" do
        expect{ Grid.new(0, 200) }.to raise_error
      end

      it "raises if height is zero" do
        expect{ Grid.new(100, 0) }.to raise_error
      end

      it "raises if width is negative" do
        expect{ Grid.new(-1, 200) }.to raise_error
      end

      it "raises if height is negative" do
        expect{ Grid.new(100, -1) }.to raise_error
      end
    end

  end

  describe "#cell_at" do
    subject(:grid) { Grid.new(3, 3) }

    context "with valid coordinates" do
      it "returns cell state at given coordinates" do
        grid.cells[ [2, 2] ] = :alive
        expect(grid.cell_at(2, 2)).to eq(:alive)
      end
    end

    context "width invalid coordinates" do
      it "returns :outside if the x coordinate is outside the given width" do
        expect(grid.cell_at(3, 1)).to eq(:outside)
      end

      it "returns :outside if the y coordinate is outside the given height" do
        expect(grid.cell_at(1, 3)).to eq(:outside)
      end

      it "returns :outside if the x coordinate is negative" do
        expect(grid.cell_at(-1, 1)).to eq(:outside)
      end

      it "returns :outside if the y coordinate is negative" do
        expect(grid.cell_at(1, -1)).to eq(:outside)
      end
    end
  end

  describe "#count_cells" do
    subject(:grid) { Grid.new(3, 3) }

    before do
      grid.cells[ [0, 0] ] = :alive
      grid.cells[ [1, 1] ] = :alive
      grid.cells[ [2, 2] ] = :alive
    end

    it "counts the total number of alive cells" do
      expect(grid.count_cells[:alive]).to eq(3)
    end

    it "counts the total number of dead cells" do
      expect(grid.count_cells[:dead]).to eq(6)
    end
  end

  describe "#seed" do
    subject(:grid) { Grid.new 10, 10 }

    it "populates the grid with the correct number of live cells" do
      grid.seed(10)

      expect(grid.count_cells[:alive]).to eq(10)
      expect(grid.count_cells[:dead]).to eq(90)
    end
  end
end