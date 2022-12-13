class DiaryEntry
    def initialize(title, contents) # title, contents are strings
        @title = title
        @contents = contents
        @words_read = 0
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
  
    def reading_time(wpm) # wpm is an integer representing the number of words the
                          # user can read per minute
      # Returns an integer representing an estimate of the reading time in minutes
      # for the contents at the given wpm.
        (count_words / wpm.to_f).ceil
    end
  
    def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                    # of words the user can read per minute
                                    # `minutes` is an integer representing the
                                    # number of minutes the user has to read
      # Returns a string with a chunk of the contents that the user could read
      # in the given number of minutes.
      # If called again, `reading_chunk` should return the next chunk, skipping
      # what has already been read, until the contents is fully read.
      # The next call after that it should restart from the beginning.
        no_of_words = wpm * minutes
        read_until_index = @words_read + no_of_words
        read_until_index = self.count_words if read_until_index > self.count_words
        until @content_arr[read_until_index - 1][-1] == "." do
            read_until_index -= 1 
        end
        if read_until_index <= @words_read
            chunk = @content_arr[@words_read...(@words_read + no_of_words)].join(" ")
        else
            chunk = @content_arr[@words_read...read_until_index].join(" ")
        end

        # @words_read += no_of_words
        @words_read += no_of_words
        @words_read = 0 if @words_read >= count_words
        return chunk
    end
end

# def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
#     # of words the user can read per minute
#     # `minutes` is an integer representing the
#     # number of minutes the user has to read
#     # Returns a string with a chunk of the contents that the user could read
#     # in the given number of minutes.
#     # If called again, `reading_chunk` should return the next chunk, skipping
#     # what has already been read, until the contents is fully read.
#     # The next call after that it should restart from the beginning.
#     words_that_can_be_read = wpm * minutes
#
#     @words_left = words_left_cal(@words_left,words_that_can_be_read)
# end
# def words_left_cal(word_content,words_that_can_be_read)
#     word_count_left = word_content.split(" ").length
#     if word_count_left <= words_that_can_be_read
#         return "You have finished the text"
#     end
#     word_array = word_content.split(" ")
#     sliced_word_array = word_array.slice(words_that_can_be_read, word_array.length - 1)
#
#     return sliced_word_array.join(" ")
#
# end
# end