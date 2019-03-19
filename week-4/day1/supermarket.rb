def queue_time(customers, n)
    #your code here
    
    array=[]
    
    (0..n-1).each do |i|
        array << []
     end
     puts array.inspect
     num_caja =0

     while customers.empty? == false do
        customers.first 
        caja_menor=array.first
        array.each_with_index do |caja,index|

            if caja.sum <= caja_menor.sum
                caja_menor = caja
                num_caja = index
            else 
                caja_menor
                num_caja
            end
        end

        array[num_caja] << customers.first
        customers.delete_at(0)      
     end

     puts array.inspect
     puts customers.inspect

    puts a = array.reduce(array[0].sum){ |tiempo_mayor,elemento|   elemento.sum >= tiempo_mayor ? tiempo_mayor= elemento.sum  : tiempo_mayor }

    end

queue_time([10,2,3,3],2)

