local item = ...
 
function item:on_created()
  -- Define the properties
  item:set_savegame_variable("possession_fire_stone")
end