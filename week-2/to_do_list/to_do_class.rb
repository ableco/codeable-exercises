class ToDo
  def initialize
    @task_list = []
  end

  def list
    #PAULO
    #Lista elementos de @task_list
    puts @task_list.empty? ? "[Lista vacia] \n ¿Te llevas bien con todos?" : "Esta es tu lista de venganza \n =============================="
    result = []
    @task_list.each_with_index do |task , id|
      result << "#{id + 1} - #{task}" if task != ""
    end
    result
  end

  def add(task)
    #DIEGO
    #Agrega elementos a @task_list
    @task_list << task
  end

  def delete(id)
    #CESAR
    #Reemplaza un elemento de @task_list con ""
    if id <= @task_list.length
      @task_list[id-1] = ""
      list
    else
      puts "ID no existe"
    end
  end

end