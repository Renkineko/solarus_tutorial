-- First, we put the parameter into a variable called "gloves".
-- (In Lua, the notation "..." refers to the parameter(s) of the script.)
local gloves = ...

function gloves:on_obtained()
  gloves:get_game():set_ability("lift", 1)
end
