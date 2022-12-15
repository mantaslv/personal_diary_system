class MusicTracker
    def initialize
        # create empty hash for tracks
        @playlist = [] 
    end

    def both_not_string?(arg1, arg2)
        (arg1.is_a? String) && (arg2.is_a? String)
    end
    
    def either_empty?(arg1, arg2)
        arg1.match?(/^\s*$/) || arg2.match?(/^\s*$/)
    end

    def add(song, artist)
        # song and artist are both strings
        # returns string message saying song was added
        raise "Please enter text only!" unless both_not_string?(song, artist)
        raise "Please enter some text!" if either_empty?(song, artist)
        if @playlist.any? do |entry| 
            entry['artist'] == artist && 
            entry['song'] == song && 
            entry['played_freq'] > 0 
        end 
            @playlist.each do |entry| 
                entry['played_freq'] += 1 if entry['artist'] == artist && entry['song'] == song
            end
        else
            @playlist.push({'artist' => artist, 'song' => song, 'played_freq' => 1})
        end
        return "#{song} - #{artist} was added."
    end

    def format_list(unform, add_to)
        unform.each { |entry| add_to.push("#{entry["song"]} - #{entry["artist"]}") }
    end
    
    def list
        # returns list of songs in nicely formatted string
        songs = []
        format_list(@playlist, songs)
        return songs.join("\n")
    end

    def sort_by(criteria)
        raise "Sort by song, artist or played_freq only!" unless ['song', 'artist', 'played_freq'].include?(criteria)
        songs = []
        sorted = @playlist.sort_by { |entry| entry[criteria] }
        sorted.reverse! if criteria == "played_freq"
        format_list(sorted, songs)
        return songs.join("\n")
    end
end