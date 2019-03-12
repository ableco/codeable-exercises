
class CaesarCipher
  def initialize(shift)
    @shift = shift
  end

  # TODO: Refactor Encode and decode. Maybe with yield
  def encode(string)
    string.upcase!
    encoded = string.split("").map do |letter|
      if letter =~ /[a-zA-Z]/
        new_code = letter.ord + @shift
        (new_code = new_code - 26) if new_code > 90
        new_code.chr
      else
        letter
      end
    end
    encoded.join
  end

  def decode(string)
    string.upcase!
    encoded = string.split("").map do |letter|
      if letter =~ /[a-zA-Z]/
        new_code = letter.ord - @shift
        (new_code = new_code + 26) if new_code < 65
        new_code.chr
      else
        letter
      end
    end
    encoded.join
  end
end

cesar = CaesarCipher.new(5)
puts cesar.decode("NY'X F XMNKY HNUMJW!!")
