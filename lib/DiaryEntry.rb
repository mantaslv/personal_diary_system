class DiaryEntry
    def initialize(title, contents) # title, contents are strings
        @title = title
        @contents = contents
        @bookmark = 0 # no. of words read
        @content_arr = @contents.split(" ")
    end
  
    def title
      # Returns the title as a string
        @title
    end
  
    def contents
      # Returns the contents as a string
        @contents
    end
  
    def count_words
      # Returns the number of words in the contents as an integer
        @content_arr.count
    end
  
    def reading_time(wpm) # wpm is an integer representing the number of words the user can read per minute
      # Returns an integer representing an estimate of the reading time in minutes for the contents at the given wpm.
        (count_words / wpm.to_f).ceil
    end
  
    def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number of words the user can read per minute
      # `minutes` is an integer representing the number of minutes the user has to read
      # Returns a string with a chunk of the contents that the user could read in the given number of minutes.
      # If called again, `reading_chunk` should return the next chunk, skipping what has already been read, until the contents is fully read.
      # The next call after that it should restart from the beginning.
        
        max_words_can_read = wpm * minutes
        last_word_index = @bookmark + max_words_can_read                # Index in content_arr of the last word to be in the chunk
        last_word_index = count_words if last_word_index > count_words  # Limits the last_word_index so it is not longer than the total length of text
        
        until @content_arr[last_word_index - 1][-1] == "." do           # Loops back through words to find one that ends with punctuation point
          last_word_index -=1
          break if last_word_index == @bookmark                         # Does not look further back than bookmark
        end
        last_word_index = @bookmark + max_words_can_read if last_word_index == @bookmark  # Resets last_word_index if no punctuation point is found
        
        chunk = @content_arr[@bookmark...last_word_index].join(" ")
        
        @bookmark = last_word_index                                     # Creates new bookmark of the point where the user has read til
        @bookmark = 0 if @bookmark == count_words                       # Resets bookmark to 0 if user has finished reading the whole text
        return chunk
    end
end