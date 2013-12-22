-- This is the main Lua script of your project.
-- You will probably make a title screen and then start a game.
-- See the Lua API! http://www.solarus-games.org/solarus/documentation/

local game -- Variable containing the game
local title_img = sol.surface.create("title_img.png")

-- Draw the title screen only if there is no game set
function sol.main:on_draw(screen)
    if game == nil then
      -- Draw the title_img on the center of the screen
      title_img:draw(screen, (320-120)/2, (240-120)/2)
    end
end

-- Function to load the game when Space is pressed.
function sol.main:on_key_pressed(key)
  if game ~= nil then
    return
  end

  if key == "space" then
    -- Setting the variable game (and not creating it anymore)
    game = sol.game.load("save1.dat")
    -- Not necessary in solarus 1.1, set the location when the game starts
    game:set_starting_location("test_map", "start")

    -- Start the game
    game:start()
  end
end
