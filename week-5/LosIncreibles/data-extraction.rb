require 'csv'

class Array
    def getId(param)
        self.index(param) + 1
    end
end


customers = CSV.read('SalesJan2009.csv')

fileCustomers=File.open("customers.sql","w")
fileSales=File.open("sales.sql","w")


fileBusiness=File.open("business.sql","w")

businessArray = customers.map{|row| row[5..6]}.uniq[1..-1]


businessArray.each do |row|
    row.map! {|registro| registro.gsub(/\'/,"''")}
    fileBusiness.puts "insert into business values(default,'#{row[0]}','#{row[1]}');"
end

namesArray = businessArray.map {|b| b[0]}
p namesArray.getId('Mothers with Children')

productArray = ['Caribbean Tour','Inka trail','Romantic Paris']
p productArray.getId('Caribbean Tour')

posArray = ['Facebook','Shop','Web','Whatsapp']
p posArray.getId('Facebook')

paymentArray = ['Amex','Diners','Mastercard','Visa']
p paymentArray.getId('Diners')


# customerArray = customers.map{|row| row[7..10]}

# salesArray = customers.map{|row| row[0]}

customers.each do |row|
     
#     #  puts row[5..6].inspect
#     #  fileBusinessArray = row[5..6]

    fileCustomers.puts "insert into customer values(default,'#{row[7]}','#{row[8]}','#{row[9]}','#{row[10]}');"
    fileSales.puts "insert into sales values(default,'#{row[0]}');"
end

# puts customers.inspect


