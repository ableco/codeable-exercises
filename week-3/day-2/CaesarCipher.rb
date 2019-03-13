class CaesarCipher
  def initialize(shift)
    @alphabet = ("A".."Z").to_a
    @num = shift
  end

  def encode(string)
    string = string.upcase
    array = string.split("")
    array.map! do |x|
      if @alphabet.include?(x)
        newpos = @alphabet.index(x) + @num
        newpos -= 26 if newpos > 25
        @alphabet[newpos]
      else
        x
      end
    end
    array.join     
  end
  
  def decode(string)
      string = string.upcase
      array = string.split("")
      array.map! do |x|
        if @alphabet.include?(x)
          newpos = @alphabet.index(x) - @num
          newpos += 26 if newpos < 0
          @alphabet[newpos]
        else
          x
        end
      end
      array.join   
  end
end

c=CaesarCipher.new(5)
puts c.encode('Code wars').to_s
puts c.encode("IT'S A SHIFT CIPHER!!")
puts c.decode("NY'X F XMNKY HNUMJW!!")