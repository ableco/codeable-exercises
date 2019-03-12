def exec_block
    puts "Antes"
    if block_given?
      ["Diego T", "Mayra"].each { |name| yield(name) }

    end
    puts "Dspues"
   end
   
    exec_block {|name| puts "Hola #{name}"}


  #  exec_block do |name| 
  #   return "Hola #{name}"}
  #  end