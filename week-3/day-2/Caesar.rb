#Write a class that, when given a string, 
#will return an uppercase string with each letter shifted 
#forward in the alphabet by however many spots the cipher was initialized to.
class CaesarCipher
    def initialize(shift)
      #your code here
      @shift=shift
    end
  
    def encode(string)
      #your code here
      string=string.upcase
      string_encode=string.chars.map do |caracter|
        if !!(/[A-Z]/ =~ caracter)
            if caracter.ord+@shift >90
                (caracter.ord+@shift-26).chr
            else
                (caracter.ord+@shift).chr
            end 
        else
            caracter
        end
      end
      string_encode.join
    end
    
    def decode(string)
      #your code here
      string=string.upcase
      string_encode=string.chars.map do |caracter|
        if !!(/[A-Z]/ =~ caracter)
            if caracter.ord-@shift <65
                (caracter.ord-@shift+26).chr
            else
                (caracter.ord-@shift).chr
            end 
        else
            caracter
        end    
      end
      string_encode.join
    end
  end


  c=CaesarCipher.new(5)

  puts c.encode("IT'S A SHIFT CIPHER!!").inspect
  puts c.decode("NY'X F XMNKY HNUMJW!!").inspect
  




