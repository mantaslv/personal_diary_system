def count_words(text)
    fail "Please enter text only!" unless text.is_a? String
    text.split(' ').count
end