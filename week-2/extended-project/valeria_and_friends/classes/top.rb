require "http"
require "json"

class Top
  BASE_URL = "https://swapi.co/api/"
  TOP_NUMBER = 5

  def initialize (query, name_main_atributte, relevant_keys)
    @query = query
    @name_main_atributte = name_main_atributte
    @relevant_keys = relevant_keys
  end

  def give_me_the_top
    json_answer = fetch_data(@query)
    results = get_results(json_answer)
    main_atrritbutes = get_main_attribute(results, @name_main_atributte)
    top_ordered = get_top_of_results(main_atrritbutes, results)
    final_top = build_final_top(@relevant_keys, top_ordered)
    final_top
  end

  def fetch_data(qquery)
    @http = HTTP.get(BASE_URL + qquery + "/")
    JSON.parse(@http)
  end

  def get_results(json_complete)
    json_complete["results"]
  end

  def get_main_attribute(result, main_attribute)
    data_main_atrritbutes = result.map { |item| item[main_attribute] }
    parse_values_to_i(data_main_atrritbutes)
  end

  def parse_values_to_i(arr_bidimensional)
    arr_bidimensional.map! do |i|
      (i == "unknown") ? 0 : i.to_i
    end
  end

  def get_top_of_results(main_atrritbutes, result)
    top = []

    TOP_NUMBER.times {
      index_maxi = main_atrritbutes.index(main_atrritbutes.max)
      top << result[index_maxi]
      result.delete_at(index_maxi)
      main_atrritbutes.delete_at(index_maxi)
    }
    top
  end

  def build_final_top(headers, content)
    final_top = []
    final_top << headers
    content.each do |block|
      main_content = headers.map do |header|
        block[header]
      end
      final_top << main_content
    end
    final_top
  end

end