=begin
Given an array of integers.
Return an array, where the first element is the count of 
positives numbers and the second element is sum of negative numbers.

If the input array is empty or null, return an empty array.

Example
For input [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, -11, -12, -13, -14, -15], 
you should return [10, -65].  
=end

def accumulate(lst)
  if lst.any?
  negatives_selected = lst.select {|num| num<0}
  if (negatives_selected.empty?)
   negatives_selected = [0]
  end
  positives_selected = lst.select {|num| num>0}
  return [positives_selected.size,negatives_selected.reduce(:+)]
else
  return lst
end
end

a = [1,2,-3]
puts accumulate(a)