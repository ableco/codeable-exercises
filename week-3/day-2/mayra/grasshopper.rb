# (1..num).inject(:+)
#  num * (num + 1) / 2
def summation(num)
    total = 0 
    (num).downto(1).each { |n| total += n }
    return total
  end
