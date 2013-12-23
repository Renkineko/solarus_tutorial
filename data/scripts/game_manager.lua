-- Script that creates a game ready to be played.

-- Usage:
-- local game_manager = require("scripts/game_manager")
-- local game = game_manager:create("savegame_file_name")
-- game:start()

local dialog_box_builder = require("scripts/dialog_box")

local game_manager = {}

-- Creates a game ready to be played.
function game_manager:create(file)

  -- Create the game (but do not start it).
  local game = sol.game.load(file)
  game:set_starting_location("test_map", "start")

  -- Prepare the dialog box menu.
  game.on_started = function()
    game.dialog_box = dialog_box_builder:create(game)
    sol.menu.start(game, game.dialog_box)
  end

  return game
end

return game_manager
