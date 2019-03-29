# Create a script that receives the path to a .json file with an array and any string, read the file, parse it as JSON, append the string at the top of the file and write it again to the disk.
# If the files doesn’t exist ask the user if he wants to create it.
# At the end print the content of the file in a table in the console.
# If you get any error show the user a nice message explaining the error.
require "json"

def jsoon(file_name)
    if !(File.file?(file_name))
        puts "Do you want to create it? (yes/no)"
        if gets.chomp == "yes"
            #File.open(file_name, "w") 
            File.open(file_name, "w") { |f| f.write("") }
        end
    else
        vale = File.read(file_name).to_s
        parsed_vale = JSON.parse(vale)

    return parsed_vale
    end
end

puts jsoon("exercise2json.json")
