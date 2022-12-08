def make_snippet(sentence)
    fail "Please enter text only!" unless sentence.is_a? String
    word_arr = sentence.split(' ')
    word_arr.count > 5 ? word_arr.first(5).join(' ') + '...' : sentence
end