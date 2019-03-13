class CaesarCipher

  def initialize(shift)  
    @shift = shift
    abc = ('A'..'Z').to_a
    new_abc = abc.rotate(shift)
    @encoder_hash = Hash[abc.zip new_abc] 
    @decoder_hash = @encoder_hash.invert
  end

  def encode(string)    

    caracters = string.upcase.split("")
    shifted_caracters = caracters.map do |c| 
      !!(c =~ /[A-Z]/)? @encoder_hash[c] : c
    end
    return shifted_caracters.join("")
  end
  
  def decode(string)
    caracters = string.upcase.split("")
    shifted_caracters = caracters.map do |c| 
      !!(c =~ /[A-Z]/)? @decoder_hash[c] : c
    end
    return shifted_caracters.join("")
  end
end

c=CaesarCipher.new(5)

puts c.encode('Codewars')
puts c.decode('HTIJBFWX') 