$global = "Hey I'm global"

class Test
  @@class = "Hey I'm class"
  @instance = "Hey I'm instance"

  def action
    local = "Hey I'm local"
    puts local
    puts_all_variables
    $global = "Global has changed"
    @@class = "Class has changed"    
    @instance = "Instance has changed"
    puts_all_variables
  end

  def puts_all_variables
    puts $global
    puts @@class
    puts @instance
  end
end

t1 = Test.new
t1.action

t2 = Test.new
t2.action