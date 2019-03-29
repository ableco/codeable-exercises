class CaesarCipher
  def initialize(shift)
    @shift = shift
    @alphabet =  Array("A".."Z")
    @shifted_alphabet = @alphabet.rotate(@shift)
  end

  def encode(string)
    hash = Hash[@alphabet.zip(@shifted_alphabet)]
    array_string = string.upcase.split("")
    result = array_string.map { |letter| hash[letter] }
    result = result.join
    result
  end
  
  def decode(string)
    hash = Hash[@shifted_alphabet.zip(@alphabet)]
    array_string = string.upcase.split("")
    result = array_string.map { |letter| hash[letter] }
    result = result.join
    result
  end
end

c=CaesarCipher.new(5)
p c.encode('Codewars') #'HTIJBFWX'
p c.decode('HTIJBFWX') #'CODEWARS