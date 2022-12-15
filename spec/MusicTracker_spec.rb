require 'MusicTracker'

RSpec.describe MusicTracker do
    context 'when tracks are added and listed' do
        music = MusicTracker.new

        it "shows message for track added" do
            result = music.add("Last Christmas", "Wham!")
            expect(result).to eq "Last Christmas - Wham! was added."
        end

        it "shows list of one song nicely formatted" do
            result = music.list
            expect(result).to eq "Last Christmas - Wham!"
        end

        it "adds a second song and returns message" do
            result = music.add("Deck the Halls", "Nat King Cole")
            expect(result).to eq "Deck the Halls - Nat King Cole was added."
        end

        it "shows list of one song nicely formatted" do
            result = music.list
            expect(result).to eq "Last Christmas - Wham!\nDeck the Halls - Nat King Cole"
        end

        it "adds a second song by the same artist and returns list" do
            music.add("Joy to the World", "Nat King Cole")
            result = music.list
            expect(result).to eq "Last Christmas - Wham!\nDeck the Halls - Nat King Cole\nJoy to the World - Nat King Cole"
        end

        it "sorts list by song alphabetically" do
            result = music.sort_by('song')
            expect(result).to eq "Deck the Halls - Nat King Cole\nJoy to the World - Nat King Cole\nLast Christmas - Wham!"
        end

        it "sorts list by artist alphabetically" do
            music.add("Santa Baby", "Eartha Kitt")
            result = music.sort_by('artist')
            expect(result).to eq "Santa Baby - Eartha Kitt\nDeck the Halls - Nat King Cole\nJoy to the World - Nat King Cole\nLast Christmas - Wham!"
        end

        it "raises error when sort by criteria entered is not an option" do
            expect{ music.sort_by("rating") }.to raise_error "Sort by song, artist or played_freq only!"
        end

        it "adds some repeat tunes and returns list sorted by most played" do
            music.add("Last Christmas", "Wham!")
            music.add("Last Christmas", "Wham!")
            music.add("Santa Baby", "Eartha Kitt")
            music.add("Santa Baby", "Eartha Kitt")
            music.add("Last Christmas", "Wham!")
            music.add("Deck the Halls", "Nat King Cole")
            result = music.sort_by("played_freq")
            expect(result).to eq "Last Christmas - Wham!\nSanta Baby - Eartha Kitt\nDeck the Halls - Nat King Cole\nJoy to the World - Nat King Cole"
        end
    end

    context 'raises error when' do
        music = MusicTracker.new

        it "song is something other than a string" do
            expect{ music.add(17, "MK") }.to raise_error "Please enter text only!"
        end

        it "artist is something other than a string" do
            expect{ music.add("Chocolate", 1975) }.to raise_error "Please enter text only!"
        end

        it "song is empty" do
            expect{ music.add("     ", "MK") }.to raise_error "Please enter some text!"
        end

        it "artist is something other than a string" do
            expect{ music.add("Chocolate", "     ") }.to raise_error "Please enter some text!"
        end
    end
end