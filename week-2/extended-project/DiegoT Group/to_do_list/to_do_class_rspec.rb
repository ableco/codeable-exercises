# require './to_do_class'
require './to_do_list'

RSpec.describe "Test To Do List" do
  to_do = ToDo.new
  
  describe "Test Class" do

    it "Add task into to_do" do
        expect(to_do.add("Read more about El Niño")).to eq(["Read more about El Niño"])
    end

    it "Add task into to_do" do
      expect(to_do.add("Write my first blog post!")).to eq(["Read more about El Niño","Write my first blog post!"])
    end

    it "Delete a task" do
        expect(to_do.delete(2)).to eq(["1 - Read more about El Niño"])
    end

    it "Delete a task" do
        expect(to_do.delete(10)).to eq("ID no existe")
    end

    it "to_do a task" do
        expect(to_do.list).to eq(["1 - Read more about El Niño"])
    end

    it "Add new task into to_do" do
      to_do.add("New Task")
      expect(to_do.list()).to eq(["1 - Read more about El Niño","3 - New Task"])
    end
  end

  describe "Test Main" do

    it "Operation wrong input" do
        expect(operation("jdfnhdjkfv", to_do)).to eq("Error: Unexpected input") 
    end

  end

end