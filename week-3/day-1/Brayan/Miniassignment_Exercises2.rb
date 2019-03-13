begin
	palindrom_lines = []
	File.read("Miniassignment_Exercises2.txt").each_line do |data|
			array_data = data.upcase.gsub(/\ |\.|\,|\?|\¿|\'/, "").split("")
			array_data.pop
			palindrom_lines << data if array_data.reverse == array_data
	end
	File.open("palindromes_file.txt", "w") do |file| 
			file.write(palindrom_lines.join(""))
	end
	puts "The file was created successful"
rescue Exception
	puts "The file or directory does not exist"
end