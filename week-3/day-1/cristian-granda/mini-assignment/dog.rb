$input = ARGV

def dog_show
  $input.each do |filename|
    if File.exist?(filename)
      puts file = File.read(filename)
    else
      puts "The file does'nt exists"
    end
  end
end

dog_show