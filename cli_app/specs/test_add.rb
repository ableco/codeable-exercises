require "../cli_codeable.rb"
require "colorize"

RSpec.describe "Add task" do
  it "Expect add one task" do
    add("t we love Codeable")
    add("t we love Able ")
    length_init = $task_array.length
    expect(length_init).to eq(2)
  end

  it "Expect show empty message" do
    #a_length = $task_array.length
    expect(add("t ")).to eq("Empty task")
  end

end

# it "expect delete one task" do
    
#   add("t some task")
#   number_tasks_before = $task_array.length
#   delete('t -d 1')
#   number_tasks_after = $task_array.length   
#   task_number_change = number_tasks_before - number_tasks_after
#   expect(task_number_change).to eq(1)
# end
