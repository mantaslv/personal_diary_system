def check_to_do(text)
    fail 'Text only please!' unless text.is_a? String 
    text.include?("#TODO")
end