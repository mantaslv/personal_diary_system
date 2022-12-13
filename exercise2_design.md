# Method Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

> As a user
> So that I can improve my grammar
> I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby
grammar_check = check_grammar?(text)
#   text is a string with word(s) in it
#   grammar_check is true or false
```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# 1
check_grammar?("")
# => false

# 2
check_grammar?("One")
# => false

# 3
check_grammar?("One.")
# => true

# 4
check_grammar?("one.")
# => false

# 5
check_grammar?("One .")
# => false

# 6
check_grammar?("One. ")
# => false

# 7
check_grammar?("OnE.")
# => true
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
