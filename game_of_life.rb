Dir["./lib/**/*.rb"].each { |f| require f }

game = Game.new(50, 50)
game.new_game(1000)
game.run