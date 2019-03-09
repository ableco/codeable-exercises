require "http"
require "json"

def fetch_data(thing)
    @http = HTTP.get("https://swapi.co/api/#{thing}/")
    @turned_into_json = JSON.parse(@http)
end

def get_results(json_complete)
    json_complete["results"]
end

def get_main_attribute(result, main_attribute)
    result.map { |item| item[main_attribute] }
end

def parse_values_to_in(main_attribute)
    main_attribute.map! do |i|
        (i == "unknown") ? 0 : i.to_i
      end
end

def get_index_ordered(attr_as_integers, result)
    top5 = []

    5.times {
        index_maxi = attr_as_integers.index(attr_as_integers.max)
        top5 << result[index_maxi]
        #indexes_top5 << index_maxi
        result.delete_at(index_maxi)
        attr_as_integers.delete_at(index_maxi)
    }
    top5
end

# def get_top5(result, arr_ordered_indexes)
#     top5 = []
#     top5 << result[arr_ordered_indexes]
#     top5
# end 

def get_top5_key_relevant(top5_arr, attr1, attr2, attr3)
    top5_arr.map! do |item|
        temp = []
        temp << item[attr1]
        temp << item[attr2]
        temp << item[attr3]
        temp
    end
end

def heaviest_people
    json = fetch_data("people")
    results = get_results(json)
    arr_main_attribute = get_main_attribute(results, "mass")
    arr_integers = parse_values_to_in(arr_main_attribute)
    arr_index_ordered = get_index_ordered(arr_integers, results)
    end_arr = get_top5_key_relevant(arr_index_ordered, "name", "mass", "height")

    headers = %w(name mass height)
    end_arr.prepend(headers)
end

def most_expensive_vehicles
    json = fetch_data("vehicles")
    results = get_results(json)
    arr_main_attribute = get_main_attribute(results, "cost_in_credits")
    arr_integers = parse_values_to_in(arr_main_attribute)
    arr_index_ordered = get_index_ordered(arr_integers, results)
    end_arr = get_top5_key_relevant(arr_index_ordered, "name", "cost_in_credits", "manufacturer")

    headers = %w(name cost_in_credits manufacturer)
    end_arr.prepend(headers)
end

def fastest_vehicles
    json = fetch_data("vehicles")
    results = get_results(json)
    arr_main_attribute = get_main_attribute(results, "max_atmosphering_speed")
    arr_integers = parse_values_to_in(arr_main_attribute)
    arr_index_ordered = get_index_ordered(arr_integers, results)
    end_arr = get_top5_key_relevant(arr_index_ordered, "name", "max_atmosphering_speed", "vehicle_class")

    headers = %w(name max_atmosphering_speed vehicle_class)
    end_arr.prepend(headers)
end

def most_populated_planets
    json = fetch_data("planets")
    results = get_results(json)
    arr_main_attribute = get_main_attribute(results, "population")
    arr_integers = parse_values_to_in(arr_main_attribute)
    arr_index_ordered = get_index_ordered(arr_integers, results)
    end_arr = get_top5_key_relevant(arr_index_ordered, "name", "population", "diameter")

    headers = %w(name population diameter)
    end_arr.prepend(headers)
end

def tallest_people
    json = fetch_data("people")
    results = get_results(json)
    arr_main_attribute = get_main_attribute(results, "height")
    arr_integers = parse_values_to_in(arr_main_attribute)
    arr_index_ordered = get_index_ordered(arr_integers, results)
    end_arr = get_top5_key_relevant(arr_index_ordered, "name", "height", "gender")

    headers = %w(name height gender)
    end_arr.prepend(headers)
end