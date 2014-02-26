local map = ...

function ladder_switch:on_activated()
    
    sol.audio.play_sound('secret')
    map:set_entities_enabled('ladder_on_tile', true)
    map:set_entities_enabled('ladder_off_tile', false)
end