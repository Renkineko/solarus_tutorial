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
  local exists = sol.game.exists(file)
  -- if the file does not exists, it's a new game so we set a default starting location
  if not exists then
    game:set_starting_location("outside_b2", "start")
  end

  -- Prepare the dialog box menu.
  game.on_started = function()
    game.dialog_box = dialog_box_builder:create(game)
    sol.menu.start(game, game.dialog_box)
  end

  game.on_paused = function()
    game:get_map():start_dialog("pause_menu", function(answer)
      if answer == 1 then
        game:save()
      end

      game:get_map():start_dialog("pause_menu_2", function(answer)
      if answer == 2 then
          sol.main.reset()
        end
      end)

      game:set_paused(false)
    end)

  end

  return game
end

return game_manager
