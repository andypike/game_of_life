require "spec_helper"

describe Grid do
  describe "#new" do

    context "with valid grid size" do
      subject(:grid) { Grid.new 100, 200 }

      it "sets the width" do
        expect(grid.width).to eq(100)
      end

      it "sets the height" do
        expect(grid.height).to eq(200)
      end
    end

    context "with invalid grid size" do
      it "raises if width is nil" do
        expect{ Grid.new nil, 200 }.to raise_error
      end

      it "raises if height is nil" do
        expect{ Grid.new 100, nil }.to raise_error
      end

      it "raises if width is zero" do
        expect{ Grid.new 0, 200 }.to raise_error
      end

      it "raises if height is zero" do
        expect{ Grid.new 100, 0 }.to raise_error
      end

      it "raises if width is negative" do
        expect{ Grid.new -1, 200 }.to raise_error
      end

      it "raises if height is negative" do
        expect{ Grid.new 100, -1 }.to raise_error
      end
    end

  end

  describe ".cell_at" do
    it "returns cell state at given coordinates"
    it "raises if the x coordinate is outside the given width"
    it "raises if the y coordinate is outside the given height"
  end

  describe ".count_cells" do
    it "counts the total number of alive cells"
    it "counts the total number of dead cells"
  end

  describe ".seed" do
    subject(:grid) { Grid.new 10, 10 }

    it "populates the grid with the correct number of live cells" do
      grid.seed(10)

      expect(grid.count_cells[:alive]).to eq(10)
      expect(grid.count_cells[:dead]).to eq(90)
    end
  end

  describe ".neighbours" do
    context "for cells with 8 neighbours" do
      it "counts the number of neighbouring cells that are alive"
      it "counts the number of neighbouring cells that are dead"
    end

    context "for cells on the top edge" do
    end

    context "for cells on the right edge" do
    end

    context "for cells on the bottom edge" do
    end

    context "for cells on the left edge" do
    end
  end
end