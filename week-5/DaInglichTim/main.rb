require "csv"

file_product = File.open("queries/product.sql", "w")
file_customer = File.open("queries/customer.sql", "w")
file_transaction = File.open("queries/transaction.sql", "w")

product = []
id_customers = 0

# Lee el csv y retorna cada row
CSV.foreach("data/sales.csv") do |row|
  id_customers += 1
  file_customer.puts "INSERT INTO customers values (default,'#{row[7]}','#{row[8]}','#{row[9]}','#{row[10]}');"
  unless product.include?(row[1])
    product << row[1]
    file_product.puts "INSERT INTO products values (default,'#{row[1]}','#{row[2]}','#{row[3]}');"
  end
  id_product = product.index(row[1])
  file_transaction.puts "INSERT INTO transaction values (default,'#{row[0]}','#{row[4]}','#{row[5].gsub(/\'/, "`")}','#{row[6]}','#{row[11]}',#{id_product + 1},#{id_customers});"
end 