def read_file(filename)
	text_lines = []
	File.read(filename).each_line do |data|
		text_lines << data
	end
	text_lines.join("")
	rescue Exception
		"The file or directory " + filename + " does not exist"
end

def write_file(filename, data)
	File.open(filename, "w") do |file| 
		file.write(data)
	end
	"OK"
	rescue LoadError
		"The file or directory " + filename + " does not exist"
end

parameters = []
ARGV.each {|val| parameters << val}
ARGV.clear

if parameters[0] == ">"
	input_data = gets.chomp
	result = write_file(parameters[1],input_data)
	puts result if result != "OK"
else
	result = 	parameters.reduce("") do |data_file, val|
							data_file + read_file(val)
						end
	puts result
end