require 'GrammarStats'

RSpec.describe GrammarStats do
    it "checks capitalised and full stopped text and returns true" do
        grammar_stats = GrammarStats.new
        result = grammar_stats.check("Hello World.")
        expect(result).to eq true
    end

    it "checks capitalised and punctuated text and returns true" do
        grammar_stats = GrammarStats.new
        result = grammar_stats.check("Hello World!")
        expect(result).to eq true
    end

    it "checks capitalised but not punctuated text and returns false" do
        grammar_stats = GrammarStats.new
        result = grammar_stats.check("Hello World")
        expect(result).to eq false
    end

    it "checks punctuated but not capitalised text and returns false" do
        grammar_stats = GrammarStats.new
        result = grammar_stats.check("hello World.")
        expect(result).to eq false
    end

    context "takes some texts and returns correct % of correctly formatted texts" do
        grammar_stats = GrammarStats.new
        
        it ": two texts" do
            # grammar_stats = GrammarStats.new
            grammar_stats.check("Hello World.")
            grammar_stats.check("Hello World")
            result = grammar_stats.percentage_good
            expect(result).to eq 50
        end

        it ": three texts" do
            # grammar_stats = GrammarStats.new
            grammar_stats.check("hello World.")
            result = grammar_stats.percentage_good
            expect(result).to eq 33
        end

        it ": five texts" do
            # grammar_stats = GrammarStats.new
            grammar_stats.check("Hello World?")
            grammar_stats.check("Hello World!")
            result = grammar_stats.percentage_good
            expect(result).to eq 60
        end
    end

    context "when argument is not valid" do
        grammar_stats = GrammarStats.new
        
        it ": not a string (boolean)" do
            expect { grammar_stats.check(true) }.to raise_error "Please enter string!"
        end

        it ": is empty" do
            expect { grammar_stats.check("") }.to raise_error "String is empty!"
        end

        it ": is empty" do
            expect { grammar_stats.check("    ") }.to raise_error "String is empty!"
        end
    end
end 
