class CaesarCipher
  def initialize(shift)
    @shift = shift
  end

  def encode(string)
    result = []
    to_acsi(string).each do |caracter|
      result << to_encrypt?(caracter, "encode")
    end
    return result.join
  end
  
  def decode(string)
    result = []
    to_acsi(string).each do |caracter|
      result << to_encrypt?(caracter, "decode")
    end
    return result.join
  end

  def to_acsi(string)
    string = string.upcase
    string.split("").map{|caracter| caracter.ord}
  end

  def to_encrypt?(caracter, action)
    if (caracter.chr).scan(/[A-Za-z]/).any?
      case action
      when "decode"
        ( (caracter - @shift) < 65) ? ((caracter - @shift) + 26).chr : (caracter - @shift).chr
      when "encode"
        ( (caracter + @shift) > 90) ? ((caracter + @shift) - 26).chr : (caracter + @shift).chr
      end
    else
      caracter.chr
    end
  end

end


# c=CaesarCipher.new(5)

# c.encode('WAFFLES')
# c.decode('BFKKQJX')
