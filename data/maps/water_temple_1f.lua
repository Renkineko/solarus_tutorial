local map = ...

function map:on_started()
    
    if not map:get_game():get_value("water_1_emptied") then
        map:set_entities_enabled('water_1_stairs', false)
    else
        map:set_entities_enabled('water_1_stairs', true)
        map:set_entities_enabled('water_1_tile', false)
        water_1_switch:set_activated(true)
    end
end

function water_1_switch:on_activated()
    
    sol.audio.play_sound('secret')
    map:set_entities_enabled('water_1_stairs', true)
    map:set_entities_enabled('water_1_tile', false)
    
    map:get_game():set_value("water_1_emptied", true)
end