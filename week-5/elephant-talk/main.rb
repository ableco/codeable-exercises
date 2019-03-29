require "csv"

products_name = []
products_days = []
products_price = []

customer_name = []
customer_city = []
customer_state = []
customer_country = []

CSV.foreach("sales.csv", headers: true) do |row|
  products_name << row[1]
  products_days << row[2]
  products_price << row[3]
  customer_name << row[7].gsub(/\'/,"`")
  customer_city << row[8].gsub(/\'/,"`")
  if row[9].nil?
    customer_state << ""
  else
    customer_state << row[9].gsub(/\'/,"`")
  end
  customer_country << row[10].gsub(/\'/,"`")
end 

products_name.uniq!
products_days.uniq!
products_price.uniq!

result = ""

products_name.each_with_index do |product, index|
  result += "INSERT INTO products(name, days, price) VALUES('#{product}', '#{products_days[index]}', '#{products_price[index]}');"
end

customer_name.each_with_index do |customer, index|
  result += "INSERT INTO customers(name, city, state, country) VALUES('#{customer}', '#{customer_city[index]}', '#{customer_state[index]}', '#{customer_country[index]}');"
end

File.write('insert.sql', result)