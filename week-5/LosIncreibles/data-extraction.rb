require 'csv'
customers = CSV.read('SalesJan2009.csv')

fileCustomers=File.open("customers.sql","w")
fileSales=File.open("sales.sql","w")

# businessArray = customers.map{|row| row[5..6]}.uniq

# customerArray = customers.map{|row| row[7..10]}

# salesArray = customers.map{|row| row[0]}

customers.each do |row|
     
    #  puts row[5..6].inspect
    #  fileBusinessArray = row[5..6]

    fileCustomers.puts "insert into customer values(default,'#{row[7]}','#{row[8]}','#{row[9]}','#{row[10]}');"
    fileSales.puts "insert into sales values(default,'#{row[0]}');"
end

# puts customers.inspect


