require "spec_helper"

describe GridRenderer do
  let(:grid) { Grid.new(3, 3) }
  let(:output) { FakeOutput.new }
  subject(:renderer) { GridRenderer.new(output) }

  it "renders a grid with spaces for dead cells and O's for live ones" do
    grid.cells[ [1, 0] ] = :alive   # XOX
    grid.cells[ [0, 2] ] = :alive   # XXX
    grid.cells[ [1, 2] ] = :alive   # OOO
    grid.cells[ [2, 2] ] = :alive

    renderer.render(grid)

    expect(output.lines).to eq([" O ", "   ", "OOO"])
  end
end