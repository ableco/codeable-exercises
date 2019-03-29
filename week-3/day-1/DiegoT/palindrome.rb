require "http"
#Make an array with http input
list = HTTP.get("https://s3-us-west-2.amazonaws.com/learnenough/phrases.txt").to_s.split("\n")

#Iterate through the array and save only the palindromes
list.each do |phrase|
    chars = phrase.gsub(/[^a-zA-Z]/,"") #keep only alphabetic chars
    if chars.reverse.downcase == chars.downcase #compare to find palindrome
        File.open("palindromes_file.txt", "a") { |file| file.puts phrase} #save palindrome on file. "a" for append
    end
end