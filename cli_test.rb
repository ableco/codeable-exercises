require "./cli"
require "colorize"

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
  
  # context "in method read" do
  #   it "expect read_file! return 3 elements" do
  #     tasks = read_file
  #     expect(tasks.length).to eq(3)
  #   end
  # end

  context "in method show" do
    it "expect tasks to show" do      
      tasks = show
      expect(tasks).to be_a Array
    end
  end

  context "in method write" do
    it "expect write! and save 'Read more about El Niño'" do
      input_text = "Read more about El Niño"
      write(input_text)
      tasks = read_file
      expected = false
      tasks.each do |value|
        if value.include?(input_text)
          expected = true
          break
        end
      end
      expect(expected).to eq(true)
    end

    it "expect write! and save 'Write my first blog post!'" do
      input_text = "Write my first blog post!"
      write(input_text)
      tasks = read_file
      expected = false
      tasks.each do |value|
        if value.include?(input_text)
          expected = true
          break
        end
      end
      expect(expected).to eq(true)
    end

    it "expect write! Adding new task and the ID should be the consecutive integer" do
      tasks_before = read_file
      last_id_before = (tasks_before[tasks_before.length - 1][0]).to_i
      puts last_id_before
      write("New Task")
      tasks_after = read_file
      last_id_after = (tasks_after[tasks_after.length - 1][0]).to_i
      puts last_id_after
      expect(last_id_after).to eq(last_id_before + 1)
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
