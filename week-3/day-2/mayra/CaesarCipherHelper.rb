# Write a class that, when given a string, will return an uppercase string with each letter 
# shifted forward in the alphabet by however many spots the cipher was initialized to.
# For example:
# c = CaesarCipher.new(5); # creates a CipherHelper with a shift of five
# c.encode('Codewars') # returns 'HTIJBFWX'
# c.decode('BFKKQJX') # returns 'WAFFLES'
class CaesarCipher
    def initialize(shift)
      @rotate = ('A'..'Z').to_a.rotate(shift).join
    end
  
    def encode(string)
      string.upcase.tr "A-Z", @rotate
    end
    
    def decode(string)
      string.tr @rotate, "A-Z"
    end
  end

  c=CaesarCipher.new(5)

# Test.assert_equals(c.encode('Codewars'), 'HTIJBFWX')
# Test.assert_equals(c.decode('HTIJBFWX'), 'CODEWARS')
# Test.assert_equals(c.encode('WAFFLES'), 'BFKKQJX')
# Test.assert_equals(c.decode('BFKKQJX'), 'WAFFLES')
# Test.assert_equals(c.encode("IT'S A SHIFT CIPHER!!"), "NY'X F XMNKY HNUMJW!!")
# Test.assert_equals(c.decode("NY'X F XMNKY HNUMJW!!"), "IT'S A SHIFT CIPHER!!")


