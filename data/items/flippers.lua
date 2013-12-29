-- First, we put the parameter into a variable called "flippers".
-- (In Lua, the notation "..." refers to the parameter(s) of the script.)
local flippers = ...

function flippers:on_obtained()
  flippers:get_game():set_ability("swim", 1)
end
