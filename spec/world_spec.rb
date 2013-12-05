require "spec_helper"

describe World do
  subject(:world) { World.new(100, 200) }

  describe "#new" do
    it "create a grid" do
      expect(world.grid.width).to eq(100)
      expect(world.grid.height).to eq(200)
    end
  end

  describe ".new_game" do
    it "seeds the grid" do
      world.new_game(10)
      expect(world.grid.count_cells[:alive]).to eq(10)
    end
  end
end