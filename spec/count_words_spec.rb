require 'count_words'

RSpec.describe 'count_words method' do
    it "takes 'Once upon a time in far far away' and returns 8" do
        result = count_words('Once upon a time in far far away')
        expect(result).to eq 8
    end

    it "takes 'this is only 5 words' and returns 5" do
        result = count_words('this is only 5 words')
        expect(result).to eq 5
    end

    it "takes 'just 3 words' and returns 3" do
        result = count_words('just 3 words')
        expect(result).to eq 3
    end
    
    context "when no string input is given" do
        it "fails" do
            expect{ count_words(true) }.to raise_error "Please enter text only!"
        end
    end
end