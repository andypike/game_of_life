require "spec_helper"

describe Game do
  let(:grid) { Grid.new(3, 3) }
  let(:output) { FakeOutput.new }
  subject(:game) { Game.new(output) }

  before do
    grid.cells[ [1, 1] ] = :alive
    grid.cells[ [1, 2] ] = :alive
    grid.cells[ [2, 0] ] = :alive
  end

  describe "#new_game" do
    it "stores the starting grid" do
      game.new_game(grid)
      expect(game.grid).to eq(grid)
    end

    it "renders the starting grid" do
      game.new_game(grid)
      expect(output.lines).to eq(["  O", " O ", " O "])
    end
  end

  describe "#game_over?" do
    it "returns false if the grid contains alive cells" do
      game.new_game(grid)
      expect(game.game_over?).to be_false
    end

    it "returns true if the grid does not contains alive cells" do
      empty_grid = Grid.new(3, 3)
      game.new_game(empty_grid)
      expect(game.game_over?).to be_true
    end

    it "raises if a starting grid has not been supplied" do
      expect{ game.game_over? }.to raise_error("You must supply a starting grid using #new_game")
    end
  end

  describe "#run" do
    it "outputs the correct grids given a fixed starting grid" do
      game.new_game(grid)
      game.run

      expect(output.lines).to eq(["  O", " O ", " O ", "   ", " OO", "   ", "   ", "   ", "   "])
    end
  end
end