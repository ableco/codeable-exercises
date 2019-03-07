class ToDo
  def initialize
    @task_list = []
  end

  def list
    #PAULO
    #Lista elementos de @task_list
    puts @task_list.empty? ? "[Lista vacia] \n ¿Te llevas bien con todos?" : "Esta es tu lista de venganza \n =============================="
    @task_list.each_with_index do |task , id|
      puts "#{id + 1} - #{task}" if task != ""
    end
  end

  def add(task)
    #DIEGO
    #Agrega elementos a @task_list
    @task_list << task
  end

  def delete(id)
    #CESAR
    #Reemplaza un elemento de @task_list con ""
  end

end