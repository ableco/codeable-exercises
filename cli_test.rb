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
  
end
