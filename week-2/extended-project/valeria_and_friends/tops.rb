require_relative "./classes/top"

expensive_vehicles_attributes = ["name", "cost_in_credits", "manufacturer"]
heaviest_people_attributes = ["name", "mass", "height"]
fastest_vehicles_attributes = ["name", "max_atmosphering_speed", "vehicle_class"]
most_populated_planets_attributes = ["name", "population", "diameter"]
tallest_people_attributes = ["name", "height", "gender"]

expensive_vehicles = Top.new("vehicles", "cost_in_credits", expensive_vehicles_attributes)
heaviest_people = Top.new("people", "mass", heaviest_people_attributes)
fastest_vehicles = Top.new("vehicles", "max_atmosphering_speed", fastest_vehicles_attributes)
most_populated_planets = Top.new("planets", "population", most_populated_planets_attributes)
tallest_people = Top.new("people", "mass", tallest_people_attributes)