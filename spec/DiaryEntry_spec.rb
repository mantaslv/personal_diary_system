require 'DiaryEntry'

TWO_HUNDRED_WORDS = (["test"] * 200).join(" ")
THREE_HUNDRED_WORDS = (["test"] * 300).join(" ")
FOUR_THOUSAND_WORDS = (["test"] * 4000).join(" ")

RSpec.describe DiaryEntry do
    it 'adds entry, returns title and contents' do
        diary_entry1 = DiaryEntry.new('Lorem Ipsum Example', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec aliquet.')
        result = diary_entry1.title
        expect(result).to eq "Lorem Ipsum Example"
        result = diary_entry1.contents
        expect(result).to eq "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec aliquet."
    end
    
    it 'adds entry then counts words' do
        diary_entry1 = DiaryEntry.new('Lorem Ipsum Example', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec aliquet.')
        result = diary_entry1.count_words
        expect(result).to eq 10
    end

    it "takes one word content at 200wpm and returns 1" do
        diary_entry1 = DiaryEntry.new('CWeg1', 'one')
        result = diary_entry1.reading_time(200)
        expect(result).to eq 1
    end

    it "takes 200 words content at 200wpm and returns 1" do
        diary_entry1 = DiaryEntry.new('CWeg2', TWO_HUNDRED_WORDS)
        result = diary_entry1.reading_time(200)
        expect(result).to eq 1
    end

    it "takes 300 words content at 200wpm and returns 2" do
        diary_entry1 = DiaryEntry.new('CWeg3', THREE_HUNDRED_WORDS)
        result = diary_entry1.reading_time(200)
        expect(result).to eq 2
    end

    it "takes 4000 words content at 400wpm and returns 10" do
        diary_entry1 = DiaryEntry.new('CWeg4', FOUR_THOUSAND_WORDS)
        result = diary_entry1.reading_time(400)
        expect(result).to eq 10
    end

    xit "takes text with wpm and minutes and gives a chunk of text that can be read in that time" do
        diary_entry1 = DiaryEntry.new("Some Words", "Today is the third day of snow and I love it.")
        result = diary_entry1.reading_chunk(3, 2)
        expect(result).to eq "Today is the third day of"
    end

    xit "returns a chunk of text and then returns next chunk of text" do
        diary_entry1 = DiaryEntry.new("Some Words", "Today is the third day of snow and I love it.")
        diary_entry1.reading_chunk(4, 1)
        result = diary_entry1.reading_chunk(2, 3)
        expect(result).to eq "day of snow and I love"
    end

    xit "return all text in multiple chunks even when last chunk is greater than length of text" do
        diary_entry1 = DiaryEntry.new("Some Words", "Today is the third day of snow and I love it.")
        diary_entry1.reading_chunk(4, 1)
        diary_entry1.reading_chunk(2, 3)
        result = diary_entry1.reading_chunk(10, 3)
        expect(result).to eq "it."
    end

    xit "return all text in a chunk and then starts again with a new chunk" do
        diary_entry1 = DiaryEntry.new("Some Words", "Today is the third day of snow and I love it.")
        diary_entry1.reading_chunk(11, 1)
        result = diary_entry1.reading_chunk(2, 2)
        expect(result).to eq "Today is the third"
    end

    it "returns chunks only up until last full stop if a full stop exists" do
        diary_entry1 = DiaryEntry.new("Full Stop Test", "A sentence. This is also a sentence. And another sentence. I can keep going on and on and on. The end.")
        result = diary_entry1.reading_chunk(2, 2)
        expect(result).to eq "A sentence."
    end

    it "returns 2 full sentence chunks" do
        diary_entry1 = DiaryEntry.new("Full Stop Test", "A sentence. This is also a sentence. And another sentence. I can keep going on and on and on. The end.")
        result = diary_entry1.reading_chunk(2, 2)
        expect(result).to eq "A sentence."
    end
end

