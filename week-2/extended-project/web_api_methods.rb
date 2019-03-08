require "http"
require "json"

def get_data(page)
    data_next = []
    request = HTTP.get(page)
    data = JSON.parse(request.to_s)["results"]
    page_number = JSON.parse(request.to_s)["next"]
    if page_number
      data_next = get_data(page_number)
    end
    return data + data_next
end