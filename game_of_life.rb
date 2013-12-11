Dir["./lib/**/*.rb"].each { |f| require f }

game = Game.new

grid = Grid.new(50, 50)
grid.seed(1000)

game.new_game(grid)
game.run
