local map = ...
local game = map:get_game()

function stone_collector_npc:on_interaction()
    local gave_fire_stone = game:get_value('obtained_bone_key')
    if gave_fire_stone then
        map:start_dialog('library_b1.stone_collector_npc.obtained_bone_key')
        return
    end
    
    local fire_stone = game:get_item("fire_stone")
    if fire_stone:get_variant() == 0 then
        map:start_dialog('library_b1.stone_collector_npc.wants_fire_stone')
    else
        map:start_dialog('library_b1.stone_collector_npc.asks_fire_stone', function(answer)
            if answer == 1 then
                map:start_dialog('library_b1.stone_collector_npc.yes', function()
                    fire_stone:set_variant(0)
                    hero:start_treasure('bone_key', 1, "obtained_bone_key")
                end)
            else
                map:start_dialog('library_b1.stone_collector_npc.no')
            end
        end)
    end
end