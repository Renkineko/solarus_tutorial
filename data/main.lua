-- This is the main Lua script of your project.
-- You will probably make a title screen and then start a game.
-- See the Lua API! http://www.solarus-games.org/solarus/documentation/

local game_manager = require("scripts/game_manager")

local game -- Variable containing the game
local title_img = sol.surface.create("title_img.png")

function sol.main:on_started()
  sol.language.set_language("fr")
end

-- Draw the title screen only if there is no game set
function sol.main:on_draw(screen)
    if game == nil then
      -- Draw the title_img on the center of the screen
      title_img:draw(screen, (320-120)/2, (240-120)/2)
    end
end

-- Function to load the game when Space is pressed.
function sol.main:on_key_pressed(key)
  -- if a game is already on, nothing to do.
  if game ~= nil then
    return
  end

  -- No game started and space is pressed
  if key == "space" then

    game = game_manager:create("save1.dat")
    -- Start the game
    game:start()
  end
end
