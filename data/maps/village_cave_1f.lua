local map = ...

function map:on_started()

  -- The switch has never been activated
  if not map:get_game():get_value("flippers_chest_enabled") then
    -- Disable the chest
    flippers_chest:set_enabled(false)
  else
    -- Set the switch already activated
    enable_chest_switch:set_activated(true)
  end
end

enable_chest_switch.on_activated = function()

  -- Enable the chest
  flippers_chest:set_enabled(true)
  sol.audio.play_sound("chest_appears")

  -- Save the fact chest has been enabled
  map:get_game():set_value("flippers_chest_enabled", true)
end
