class CaesarCipher
  def initialize(value)
    @rotate = ('A'..'Z').to_a.rotate(value).join("")
  end

  def encode(word)
    word.upcase.tr "A-Z", @rotate
  end

  def decode(word)
    word.tr @rotate, "A-Z"
  end
end


prueba = CaesarCipher.new(1)


puts prueba.encode('Codeable')