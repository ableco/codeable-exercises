def collazt(n)
  steps = 0
  while n != 1
    if n.even?
      n = n / 2
    else
      n = (n * 3) + 1 if n.odd?
    end
    steps += 1
  end
  steps
end

puts collazt(ARGV.first.to_i)
