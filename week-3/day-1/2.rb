require 'open-uri'
web_contents  = open("https://s3-us-west-2.amazonaws.com/learnenough/phrases.txt") {|f| f.read }
arra = web_contents.split("\n")

n = arra.select {|p| p == p.reverse} 
 puts n.inspect
 File.write("palindromes_file.txt", n)




# if array2 === array2.reverse
  
# end


# puts palindromo
