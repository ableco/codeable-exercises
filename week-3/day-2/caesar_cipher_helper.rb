class CaesarCipher
  def initialize(shift)
    @shift = shift
      #your code here
  end
  
  def encode(string)
    temporal = []
    temp_val = 0
    new_string = string.upcase.split('')
    new_string.each do |value|
      if (value =~ /[A-Z]/)
        temp_val = value.ord + @shift
        if (temp_val > 90)
          temp_val = 64 + (temp_val.remainder 90)
        end
        value = (temp_val).chr
        temporal << value
      else
        temporal << value
      end
    end
    temporal.join("")
  end
    
  def decode(string)
    temporal = []
    temp_val = 0
    new_string = string.split('')
    new_string.each do |value|
      if (value =~ /[A-Z]/)
        temp_val = value.ord - @shift
        if(temp_val < 65)
          temp_val = 90 - (64 - temp_val)
        end
        value = (temp_val).chr
        temporal << value
      else
        temporal << value
      end
    end
    temporal.join("")
  end
end

caesar = CaesarCipher.new(20)
puts "codificando: #{caesar.encode("Codewars")}"

puts "Decodificando: #{caesar.decode("WIXYQULM")}"

puts "New list"
puts "-"*15
puts "Resultado: #{caesar.encode("I'm working with Sally. Till later")}"

puts "Resultado: #{caesar.decode("C'G QILECHA QCNB MUFFS. NCFF FUNYL")}"