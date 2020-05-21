require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/turn'
require './lib/player'

game = Game.new
game.setup
game.start
