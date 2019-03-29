require "csv"
def products_customers
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
  
  File.write('products_customers.sql', result)
end

def transactions
  customer_counter = 0
  file =  File.open("transactions.sql", "w")
  CSV.foreach("sales.csv", headers: true) do |row|
    product = row[1]
    case product
    when "Caribbean Tour"
      data_product = 1
    when "Romantic Paris"
      data_product = 2
    when "Inka trail"
      data_product = 3
    end
    customer_counter = customer_counter + 1

    file.puts "INSERT INTO transactions(date_time, product_id, payment, pos, customer_id, seller, contact) VALUES ('#{row[0]}', '#{data_product}', '#{row[4]}', '#{row[11]}', '#{customer_counter}', '#{row[5].gsub(/\'/, "`")}', '#{row[6].gsub(/\'/, "`")}');"
  end
end

products_customers
transactions