def reading_time(text)
    fail "Text only please!" unless text.is_a? String
    wam = 200.0   # words a minute
    mins = text.split(" ").count / wam
    mins.ceil
end