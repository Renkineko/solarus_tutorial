-- Script that creates a dialog box for a game.

-- Usage:
-- local dialog_box_builder = require("scripts/dialog_box")
-- local dialog_box = dialog_box_builder:create(game)
-- sol.menu.start(game, dialog_box)

local dialog_box_builder = {}

-- Returns a dialog box menu ready to be started on a game.
function dialog_box_builder:create(game)

  local dialog_box = {
  
    on_draw = function(self, dst_surface)
      -- The dialog box is actually still built-in for now.
      local map = game:get_map()
      if map ~= nil and map:is_dialog_enabled() then
        map:draw_dialog_box(dst_surface)
      end
    end,
  }

  return dialog_box
end

return dialog_box_builder

