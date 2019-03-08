require './cli_codeable.rb'
# T1.Add a task:
# - Read more about El Niño
# - Write my first blog post!
# T2 List the tasks
# T3 Delete a task
# T4 Delete a non existant ID: show an error
# T5 Use an unexpected flag: show an error
# T6 Add new tasks, ID should be the consecutive integer (skipping the ones deleted)

RSpec.describe "test #cli_codeable" do
  
  it "expect clear list of tasks" do    
    expect(clear_all()).to be_empty
  end

  it "expect delete one task" do
    
    add("t some task")
    number_tasks_before = $task_array.length
    delete('t -d 1')
    number_tasks_after = $task_array.length   
    task_number_change = number_tasks_before - number_tasks_after
    expect(task_number_change).to eq(1)
  end

end