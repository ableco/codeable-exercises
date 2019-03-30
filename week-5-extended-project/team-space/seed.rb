require 'csv'

headers, *data = CSV.read("data.csv")

file_agencies = File.open("seeds/agencies.sql", "w")
file_customers = File.open("seeds/customers.sql", "w")
file_sales = File.open("seeds/sales.sql", "w")
file_tours = File.open("seeds/tours.sql", "w")

tours = []
agencies = []
customers = []

data.each do |row|
  row = row.map do |r|
    r.gsub("'", "''") unless r.nil?
  end

  row[0] = "to_timestamp('#{row[0]}', 'MM/DD/YY HH24:MI')"

  unless tours.include? row[1]
    tours << row[1]
    file_tours.puts "INSERT INTO tours VALUES (default, '#{row[1]}', '#{row[2]}', '#{row[3]}');"
  end

  customers << row[8]
  file_customers.puts "INSERT INTO customers VALUES (default, '#{row[7]}', '#{row[8]}', '#{row[9]}', '#{row[10]}');"
  
  unless agencies.include? row[5]
    agencies << row[5]
    file_agencies.puts "INSERT INTO agencies VALUES (default, '#{row[5]}', '#{row[6]}');"
  end
  
  file_sales.puts "INSERT INTO sales VALUES (default, #{row[0]}, '#{row[4]}', '#{row[11]}', #{(tours.find_index row[1]) + 1}, #{(customers.find_index row[8]) + 1}, #{(agencies.find_index row[5]) + 1});"
end
