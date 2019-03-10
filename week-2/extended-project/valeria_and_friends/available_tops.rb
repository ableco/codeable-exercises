require_relative "./classes/top"
require_relative "./classes/system"

expensive_vehicles_attr = ["name", "cost_in_credits", "manufacturer"]
heaviest_people_attr = ["name", "mass", "height"]
fastest_vehicles_attr = ["name", "max_atmosphering_speed", "vehicle_class"]
most_populated_planets_attr = ["name", "population", "diameter"]
tallest_people_attr = ["name", "height", "gender"]

expensive_vehicles = Top.new("vehicles", "cost_in_credits", expensive_vehicles_attr)
heaviest_people = Top.new("people", "mass", heaviest_people_attr)
fastest_vehicles = Top.new("vehicles", "max_atmosphering_speed", fastest_vehicles_attr)
most_populated_planets = Top.new("planets", "population", most_populated_planets_attr)
tallest_people = Top.new("people", "mass", tallest_people_attr)

available_tops = [
  expensive_vehicles, fastest_vehicles, tallest_people, heaviest_people, most_populated_planets
]

our_top_fives = System.new(available_tops)

our_top_fives.run