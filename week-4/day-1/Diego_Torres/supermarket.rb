def queue_time(customers, n)
  count = 0
  while customers.length > 0
    puts "Inicio ronda. Count = #{count}"
    in_checkout = customers.take(n)
    n.times {|x| customers.shift}

    puts "in_checkout = #{in_checkout.to_s}"
    puts "customers = #{customers.to_s}"

    min = in_checkout.sort[0]
    puts "min = #{min}"

    count += min
    in_checkout.map! { |x| x-min}
    in_checkout.delete(0)
    in_checkout.each {|x| customers.unshift(x)}
    puts "customers para siguiente ronda = #{customers.to_s}"
    puts "Fin ronda. Count = #{count}"
    puts "**********************************"
  end
  count
end

queue_time([], 1)