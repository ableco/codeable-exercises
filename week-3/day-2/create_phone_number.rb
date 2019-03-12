def createPhoneNumber(array_numbers)
    
    en_orden=array_numbers.sort.join
    # en_orden.each do |item|
    #\d{3}\s\d{3}-\d{4}
    numero_cel = "(#{en_orden[0..2]}) #{en_orden[3..5]}-#{en_orden[6..9]}"
    #puts numero_cel
  end

  puts createPhoneNumber([3,4,4,1,2,2,5,7,9,6])