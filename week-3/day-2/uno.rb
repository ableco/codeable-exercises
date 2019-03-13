class CaesarCipher
  def initialize(shift)
    @shift = shift
  end
  def encode(string)
    encoded = string.downcase
    result= encoded.split("").map do |letra|
      if letra.ord >=97 && letra.ord <= 122
       n = (letra[0].ord + @shift)
          if n > 122
          n = n - 26
          end
        n.chr
      else
        letra
      end
    end
  return result.join.upcase
  end
  
  def decode(string)
    decoded = string.downcase
    resul= decoded.split("").map do |letra|
      if  letra.ord >=97 && letra.ord<= 122
          c = (letra[0].ord - @shift)
          if c < 97
          c = c + 26
          end
        c.chr
      else
        letra
      end
    end
  return resul.join.upcase
  end
end  

