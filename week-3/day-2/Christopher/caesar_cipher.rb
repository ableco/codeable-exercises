class CaesarCipher
    def initialize(shift)
      alphabet = 'abcdefghijklmnopqrstuvwxyz'
      @shift = shift % alphabet.size
      @alphabet = alphabet
    end
  
    def encode(string)
        s1=string.downcase
      s1.chars.map { |char| @alphabet[@alphabet.index(char) + @shift - @alphabet.size] }.join.upcase
    end
  
    def decode(string)
        s2=string.downcase
      s2.chars.map { |char| @alphabet[@alphabet.index(char) - @shift] }.join.upcase
    end
end