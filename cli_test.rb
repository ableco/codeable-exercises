require "./cli"

def init
  puts "init"
  @task = read_file
end

def back
  puts "back"
  save_file(@task)
end

RSpec.describe "Test cli" do
  before(:each) do
    init
  end

  after(:each) do
    back
  end
  
  context "in method read" do
    it "expect read_file! return 3 elements" do
      tasks = read_file
      expect(tasks.length).to eq(3)
    end

  end
  
  context "in method delete" do
    it "delete 1 task return tasks -1" do
      tasks = read_file
      delete("3")
      tasks_new = read_file
      expect(tasks_new.length).to eq(tasks.length-1)

    end

    it "delete 2 task return tasks -2" do
      tasks = read_file
      delete("3")
      delete("2")
      tasks_new = read_file
      expect(tasks_new.length).to eq(tasks.length-2)

    end

    it "delete 1 task doesn't exist , return original tasks" do
      tasks = read_file
      delete("6")
      tasks_new = read_file
      expect(tasks_new.length).to eq(tasks.length)

    end

    it "delete 1 task doesn't exist , return original tasks" do
      tasks = read_file
      mesg_error=delete("6")
      expect(mesg_error).to eq("No existe tarea")

    end

  end


end
