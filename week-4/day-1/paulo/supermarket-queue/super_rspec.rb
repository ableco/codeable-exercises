require './super'

RSpec.describe "Test supermarket queue" do

  it "wrong answer for case with an empty queue" do
    expect(queue_time([], 1)).to eq(0)
  end

  it "wrong answer for a single person in the queue" do
    expect(queue_time([5], 1)).to eq(5)
  end

  it "wrong answer for a single person in the queue" do
    expect(queue_time([2], 5)).to eq(2)
  end

  it "wrong answer for a single till" do
    expect(queue_time([10,3,2,4,3,5], 3)).to eq(11)
  end

  it "wrong answer for a single till" do
    expect(queue_time([1,2,3,4,5], 1)).to eq(15)
  end

  it "wrong answer for a case with a large number of tills" do
    expect(queue_time([1,2,3,4,5], 100)).to eq(5)
  end

  it "wrong answer for a case with two tills" do
    expect(queue_time([2,2,3,3,4,4], 2)).to eq(9)
  end

end