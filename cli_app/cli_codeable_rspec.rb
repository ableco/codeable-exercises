require './cli_codeable.rb'

RSpec.describe "test #cli_codeable" do
  
  it "expect clear list of tasks" do
    expect(clear_all()).to be_empty
  end

end

