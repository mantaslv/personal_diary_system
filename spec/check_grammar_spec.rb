require 'check_grammar?'

RSpec.describe 'check_grammar method' do
    it "pass empty string to return false" do
        result = check_grammar?("")
        expect(result).to eq false
    end

    it "pass 'One' to return false" do
        result = check_grammar?("One")
        expect(result).to eq false
    end

    it "pass 'One.' to return true" do
        result = check_grammar?("One.")
        expect(result).to eq true
    end

    it "pass 'one.' to return false" do
        result = check_grammar?("one.")
        expect(result).to eq false
    end

    it "pass 'One!' to return true" do
        result = check_grammar?("One!")
        expect(result).to eq true
    end

    it "pass 'One. ' to return false" do
        result = check_grammar?("One. ")
        expect(result).to eq false
    end

    it "pass 'OnE.' to return true" do
        result = check_grammar?("OnE.")
        expect(result).to eq true
    end

    context "when something other than text is passed" do
        it "fails" do
            expect { check_grammar?(true) }.to raise_error "Text only please!"
        end
    end
end