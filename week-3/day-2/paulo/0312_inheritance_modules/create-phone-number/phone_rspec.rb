require './phone'

RSpec.describe "Test for create a phone number" do

  it "Create phone number" do
    expect(createPhoneNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 0])).to eq("(123) 456-7890")
  end

end