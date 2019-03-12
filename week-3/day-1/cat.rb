class Archivo
    attr_accessor :name
    def initialize(input)
        @input_u = input.gsub("> ","")
        
    end

    def split_files
    @input_separated = @input_u.split.each_slice(1).map{|a|a.join ' '}
        if @input_separated[0] == "dog"
            @files_to_attach = @input_separated[1..-2]
            @file_to_receive = @input_separated[-1]
            puts @files_to_attach.inspect
            puts @file_to_receive.inspect
        else
            "Only command cat allowed" 
        end
    end
    def read_and_join_files
        @files_to_attach.each do |value| # every value is a name file
            File.open(@file_to_receive,"a+") do |file|
                file.puts(File.read(value))
            end
        end
        
    end
        

 end

    user_input = "dog 1.txt 2.txt > 3.txt"
    r= Archivo.new(user_input)
    r.split_files
    r.read_join_files
   
