require './caesar'

RSpec.describe "Test encrypt" do
  c = CaesarCipher.new(5)
  
  it "Encode the string 'Codewars'" do
    expect(c.encode("Codewars")).to eq("HTIJBFWX")
  end

  it "Encode the string 'WAFFLES'" do
    expect(c.encode("WAFFLES")).to eq("BFKKQJX")
  end

  it "Encode the string 'IT'S A SHIFT CIPHER!!'" do
    expect(c.encode("IT'S A SHIFT CIPHER!!")).to eq("NY'X F XMNKY HNUMJW!!")
  end

  it "Decode the string 'HTIJBFWX'" do
    expect(c.decode("HTIJBFWX")).to eq("CODEWARS")
  end

  it "Decode the string 'BFKKQJX'" do
    expect(c.decode("BFKKQJX")).to eq("WAFFLES")
  end

  it "Decode the string 'NY'X F XMNKY HNUMJW!!'" do
    expect(c.decode("NY'X F XMNKY HNUMJW!!")).to eq("IT'S A SHIFT CIPHER!!")
  end

end
