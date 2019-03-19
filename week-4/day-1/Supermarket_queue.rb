def queue_time(customers, n)
    def queue_time(customers, n)
        if (customers.length == 0 || n== 0)
          return 0
        else
          tills = Array.new(n,0)
          i = 0
          while i < customers.length
            tills[0] = tills[0] + customers[i]
            tills.sort!
            i = i + 1
          end
          return tills[n-1]
        end
      end

    # arr = Array.new(n, 0)
    # customers.each { |customer| arr[arr.index(arr.min)] += customer }
    # arr.max
end