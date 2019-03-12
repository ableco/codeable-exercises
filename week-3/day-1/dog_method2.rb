def dog(file1, file2)
    content = ""
    File.read(file1).each_line do |line|
        content << line
    end

    File.open(file2, "w") do |file|
        file.write(content)
    end
end

dog(ARGV[0], ARGV[1])