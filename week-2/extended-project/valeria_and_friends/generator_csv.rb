require "csv"

CSV.open("file.csv", "wb") do |csv|
  csv << ["animal", "count", "price"]
  csv << ["fox", "1", "$90.00"]
end