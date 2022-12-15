# MusicTracker Class Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

> As a user
> So that I can keep track of my music listening
> I want to add tracks I've listened to and see a list of them.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE

class MusicTracker
    def initialize
        # create empty hash for tracks
    end

    def add(song, artist)
        # song and artist are both strings
        # returns string message saying song was added
    end

    def list(sort_by)
        # returns list of songs in nicely formatted string
    end

    def sort_by(criteria)
        # criteria is a string - selection from: song, artist, most_played.
    end
end 
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# 1
music = MusicTracker.new
music.add("Last Christmas", "Wham!")            # => "Last Christmas - Wham! was added."
music.list                                      # => "Last Christmas - Wham!"
music.add("Deck the Halls", "Nat King Cole")    # => "Deck the Halls - Nat King Cole was added."
music.list                                      # => "Last Christmas - Wham!\nDeck the Halls -     Nat King Cole"
music.add("Joy to the World", "Nat King Cole")
music.list                                      # => "Last Christmas - Wham!\nDeck the Halls -     Nat King Cole\nJoy to the World - Nat King Cole"

# 2
music.sort_by("song")                           # => "Deck the Halls - Nat King Cole\nJoy to the World - Nat King Cole\nLast Christmas - Wham!"
music.add("Santa Baby", "Eartha Kitt")
music.sort_by("artist")                         # => "Santa Baby - Eartha Kitt\nDeck the Halls - Nat King Cole\nJoy to the World - Nat King Cole\nLast Christmas - Wham!"

# 3
music.add("Last Christmas", "Wham!")
music.add("Last Christmas", "Wham!")
music.add("Santa Baby", "Eartha Kitt")
music.add("Santa Baby", "Eartha Kitt")
music.add("Last Christmas", "Wham!")
music.add("Deck the Halls", "Nat King Cole")
music.sort_by("most_played")                    # => "Last Christmas - Wham!\nSanta Baby - Eartha Kitt\nDeck the Halls - Nat King Cole\nJoy to the World - Nat King Cole"
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
