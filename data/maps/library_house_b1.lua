local map = ...
local game = map:get_game()

function receptionnist_counter:on_interaction()
    receptionnist:get_sprite():set_direction(3)
    map:start_dialog('library_b1.reception')
end

function librarian_shelf:on_interaction()
    the_librarian:get_sprite():set_direction(3)
    map:start_dialog('library_b1.librarian')
end


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

for _, entity in ipairs(map:get_entities("npc_book_")) do
    function entity:on_interaction()
        local dialog_name = entity:get_name():sub(10)
        map:start_dialog('library_b1.book_'..dialog_name, function(answer)
            if answer == 2 then
                map:start_dialog('library_b1.read_'..dialog_name)
            end
        end)
    end
end