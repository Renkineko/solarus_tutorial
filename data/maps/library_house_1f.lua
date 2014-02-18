local map = ...
local game = map:get_game()

function receptionnist_counter:on_interaction()
    receptionnist:get_sprite():set_direction(3)
    map:start_dialog('library_1f.reception')
end

for _, entity in ipairs(map:get_entities("npc_book_")) do
    function entity:on_interaction()
        local dialog_name = entity:get_name():sub(10)
        map:start_dialog('library_1f.book_'..dialog_name, function(answer)
            if answer == 2 then
                map:start_dialog('library_1f.read_'..dialog_name)
            end
        end)
    end
end