require './cli_codeable.rb'
# T1.Add a task: (Deyvi)
# - Read more about El Niño
# - Write my first blog post!
# T2 List the tasks (Mayra)
# T3 Delete a task (Ricardo)
# T4 Delete a non existant ID: show an error (Diego)
# T5 Use an unexpected flag: show an error (Workteam)
# T6 Add new tasks, ID should be the consecutive integer (skipping the ones deleted)

RSpec.describe "test #cli_codeable" do
  
  it "expect clear list of tasks" do
    expect(clear_all()).to be_empty
  end

end

