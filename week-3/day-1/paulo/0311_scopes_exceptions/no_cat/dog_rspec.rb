require './dog_operation'

# TODO: run test exemple 'rspec dog_rspec.rb'

RSpec.describe "Test to dog" do
    dog = Dog.new

    describe "Test Operation" do

        # it "Successful operation input" do
        #     expect(operation("cat ",dog)).to eq("Hi")
        # end

        it "Wrong operation input" do
            expect(operation("ererer", dog)).to eq("Error: Unexpected input")
        end

        it "Create file" do
            expect(operation("cat > hola.txt", dog)).to eq("create file")
        end

        it "Add file" do
            expect(operation("cat >> hola.txt", dog)).to eq("add file")
        end

        it "View file" do
            expect(operation("cat hola.txt", dog)).to eq("view file")
        end

        it "Concat file" do
            expect(operation("cat hola1.txt hola2.txt", dog)).to eq("concat file")
        end

        it "Concat and transfer file" do
            expect(operation("cat hola1.txt hola2.txt > hola3.txt", dog)).to eq("concat and transfer file")
        end
    end

end