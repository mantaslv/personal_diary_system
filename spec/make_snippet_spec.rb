require 'make_snippet'

RSpec.describe 'make_snippet method' do
    it "takes 'Once upon a time in far far away' and returns first 5 words with ellipsis" do
        result = make_snippet('Once upon a time in far far away')
        expect(result).to eq 'Once upon a time in...'
    end

    it "takes 'this is only 5 words' and returns same thing" do
        result = make_snippet('this is only 5 words')
        expect(result).to eq 'this is only 5 words'
    end

    it "takes 'just 3 words' and returns same thing" do
        result = make_snippet('just 3 words')
        expect(result).to eq 'just 3 words'
    end
    
    context "when no string input is given" do
        it "fails" do
            expect{ make_snippet(true) }.to raise_error "Please enter text only!"
        end
    end
end