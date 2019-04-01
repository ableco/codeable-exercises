file = File.open("Data.csv","r+")
data_input = []
file.each do |line|
  data_input << line.gsub("'","''").gsub("\r\n","").split(",")
end

File.open("script_db.sql","a+") do |data_file|
    data_input.each do |line|
      data_file.puts "INSERT INTO temporal VALUES ('#{line[0]}','#{line[1]}',#{line[2]},#{line[3]},'#{line[4..11].join("','")}');"
    end
end

  
