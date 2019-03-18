require_relative 'logic_methods'

RSpec.describe "Test logic_methods" do

  #True or false if file *.txt exists or not in Data file
  
  it "should return TRUE because Carlos.txt exists" do
    result = check_file_data_existence("Carlos") #txt is 
    expect(result).to be true
  end
  it "should return FALSE because Someone.txt doesn't exist" do
    result = check_file_data_existence("Someone") #txt is 
    expect(result).to be false
    
  end
 # Verify read_string is returning a file

  it "should webpage about.html must be expect when is called" do
      result=read_string("about.html")
      # about. html - webpage where Members' answers are shown.
      expect(result).to include(File.read("../about.html"))
      
  end

end
