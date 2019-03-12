# Create a copy of the cat command using Ruby and call it dog.
# Be sure to support reading multiple files and copying the content to another file.

def dog(file_name)
    File.read("#{file_name}").each_line do |line|
        puts line
    end
end

dog(ARGV[0])
