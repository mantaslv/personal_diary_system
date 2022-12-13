require 'reading_time'

RSpec.describe 'reading_time method' do
    it "takes and empty string and returns 0" do
        result = reading_time("")
        expect(result).to eq 0
    end

    it "takes one word string and returns 1" do
        result = reading_time("one")
        expect(result).to eq 1
    end

    it "takes 200 words and returns 1" do
        TWO_HUNDRED_WORDS = (["test"] * 200).join(" ")
        result = reading_time(TWO_HUNDRED_WORDS)
        expect(result).to eq 1
    end

    it "takes 300 words and returns 1" do
        THREE_HUNDRED_WORDS = (["test"] * 300).join(" ")
        result = reading_time(THREE_HUNDRED_WORDS)
        expect(result).to eq 2
    end
    
    it "takes 400 words and returns 1" do
        FOUR_HUNDRED_WORDS = (["test"] * 400).join(" ")
        result = reading_time(FOUR_HUNDRED_WORDS)
        expect(result).to eq 2
    end

    it "takes 5000 words and returns 25" do
        FIVE_THOUSAND_WORDS = (["test"] * 5000).join(" ")
        result = reading_time(FIVE_THOUSAND_WORDS)
        expect(result).to eq 25
    end

    context "when something other than text is given" do
        it "fails" do
            expect { reading_time(true) }.to raise_error "Text only please!"
        end
    end     
end