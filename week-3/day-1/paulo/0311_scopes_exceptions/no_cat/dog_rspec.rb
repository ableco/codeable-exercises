require './dog_operation'

# TODO: run test exemple 'rspec dog_rspec.rb'

RSpec.describe "Test to dog" do
    dog = Dog.new

    describe "Test Operation" do

        it "Successful operation input" do
            expect(operation("cat ",dog)).to eq("Hi")
        end

        it "Wrong operation input" do
            expect(operation("ererer", dog)).to eq("Error: Unexpected input")
        end

    end

end