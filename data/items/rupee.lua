local item = ...
local amounts = {1, 5, 20, 50, 100, 300} -- the amount for each variant
 
function item:on_created()
 
    -- Set properties of rupees
    item:set_shadow("small") -- the default shadow is the big one, not the case for rupees
    item:set_can_disappear(true) -- after some delay, the rupee will disappear
    item:set_brandish_when_picked(false) -- the hero does not brandish rupees when picked because it's a common item
    item:set_sound_when_picked("picked_rupee") -- the sound the rupee make when picked
end
 
function item:on_obtaining(variant, savegame_variable)
    local amount = amounts[variant] -- we get the amount of rupee for this variant
    item:get_game():add_money(amount) -- we add the game 
end