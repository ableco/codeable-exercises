a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, -11, -12, -13, -14, -15]

def count_positives_sum_negatives(array)
  return [] if (array == nil || array == [])

  positive_numbers = array.select do |v|
    v.positive?
  end.count
  
  negative_numbers = array.select do |v|
    v.negative?
  end.sum
  
  positive_and_negative = []
  positive_and_negative << positive_numbers
  positive_and_negative << negative_numbers
  
  return positive_and_negative
end

puts count_positives_sum_negatives(a)
