class CaesarCipher
  def initialize(shift)
    @position = shift
  end

  def encode(string)
    string.upcase.chars.map do |val|
      if (65..90) === val.ord
        cipher = (val.ord + @position)
        cipher = cipher - 26 if cipher > 90
        val = cipher.chr
      end
      val
    end.join
  end
  
  def decode(string)
    string.chars.map do |val|
      if (65..90) === val.ord
        cipher = (val.ord - @position)
        cipher = cipher + 26 if cipher < 65
        val = cipher.chr
      end
      val
    end.join
  end
end

c = CaesarCipher.new(5)
#HTIJBFWX
c.encode('Codewars')
#CODEWARS
c.decode('HTIJBFWX')