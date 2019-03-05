a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, -11, -12, -13, -14, -15]

def count_positives_sum_negatives(lst)
  return [] if (lst == nil || lst == [])
  group = lst.group_by {|val| val.positive?}
  return [group[true].count, group[false].reduce(&:+)]
end

puts count_positives_sum_negatives(a)
