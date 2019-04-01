require 'rspec'
require_relative '../fill_data_csv'


describe FillData do
  before do
    filler_data = FillData.new
    filler_data.products_customers
    filler_data.transactions
  end

  it "Count number of lines in products + customers insert file" do
    file = File.open($file_products_customers,"r")
    count = file.readlines.size
    expect(count).to eq(3 + 998)
  end

  it "Count number of lines in transactions insert file" do
    file = File.open($file_transactions,"r")
    count = file.readlines.size
    expect(count).to eq(998)
  end

  it "Count number of lines in sales.csv file" do
    file = File.open("sales.csv","r")
    count = file.readlines.size
    expect(count).to eq(999)
  end
end