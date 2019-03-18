require './stack'

RSpec.describe "Test implement stack using queues" do
  stack = MyStack.new()
  out = []

  4.times do |i|
    it "push value #{i} " do
      expect(stack.push(i)).to eq(out.push(i))
    end
    puts i
  end

  it "pop value" do
    expect(stack.pop()).to eq(3)
  end

  it "top value" do
    expect(stack.top()).to eq(2)
  end

  it "empty value" do
    expect(stack.empty()).to eq(false)
  end

end