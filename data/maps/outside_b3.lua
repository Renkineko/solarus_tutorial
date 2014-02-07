local map = ...

local function teleport_sensor(to_sensor, from_sensor)
  local hero_x, hero_y = hero:get_position()
  local to_sensor_x, to_sensor_y = to_sensor:get_position()
  local from_sensor_x, from_sensor_y = from_sensor:get_position()
  
  hero:set_position(hero_x - from_sensor_x + to_sensor_x, hero_y - from_sensor_y + to_sensor_y)
end

function hidden_sensor:on_activated()
  teleport_sensor(hidden_sensor_2, self)
end

function hidden_sensor_3:on_activated()
  teleport_sensor(hidden_sensor_4, self)
end

function hidden_sensor_5:on_activated()
  teleport_sensor(hidden_sensor_6, self)
end

for _, entity in ipairs(map:get_entities("grass1")) do
  function entity:on_removed()
    map:set_entities_enabled("grass1", false)
  end
end

for _, entity in ipairs(map:get_entities("grass2")) do
  function entity:on_removed()
    map:set_entities_enabled("grass2", false)
  end
end

for _, entity in ipairs(map:get_entities("grass3")) do
  function entity:on_removed()
    map:set_entities_enabled("grass3", false)
  end
end