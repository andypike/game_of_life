require "spec_helper"

describe Game do
  subject(:game) { Game.new(100, 200, FakeOutput.new) }

  describe ".new" do
    it "create a grid" do
      expect(game.grid.width).to eq(100)
      expect(game.grid.height).to eq(200)
    end
  end

  describe "#new_game" do
    it "seeds the grid" do
      game.new_game(10)
      expect(game.grid.alive_cells).to eq(10)
    end
  end

  describe "#game_over?" do
    it "returns false if the grid contains alive cells" do
      game.new_game(10)
      expect(game.game_over?).to be_false
    end

    it "returns true if the grid does not contains alive cells" do
      expect(game.game_over?).to be_true
    end
  end

  describe "#run" do
    it "generates a new grid for each generation - spiked that out first"
  end
end