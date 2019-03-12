#Read this file: Detect all palindromes, writing them out one at a time. 
#Then, save all the palindromes in a file called palindromes_file.txt
require 'palindrome'

palindromes = File.readlines('phrases.txt').select(&:palindrome?)
palindromes.each { |palindrome| puts "#{palindrome}" }
File.write('palindromes_file.txt', palindromes.join)
