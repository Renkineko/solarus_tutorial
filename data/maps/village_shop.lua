local map = ...
local game = map:get_game()

function shop_counter:on_interaction()
    shop_seller:get_sprite():set_direction(3)
    map:start_dialog('shop.npc')
end