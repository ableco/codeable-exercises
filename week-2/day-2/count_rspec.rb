require "./count"

RSpec.describe "test #count_positives_sum_negatives" do
    it "expect empty with nil" do
        expect(count_positives_sum_negatives(nil)).to eq([])
    end

    it "expect empty with empty" do
        expect(count_positives_sum_negatives([])).to eq([])
    end

    it "expect counting and sum" do
        expect(count_positives_sum_negatives([1, 2, 3, 4, 5, -6, -7, -8, -9, -10])).to eq([5, -40])
    end
end