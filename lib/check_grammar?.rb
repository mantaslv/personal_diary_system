def check_grammar?(text)
    fail "Text only please!" unless text.is_a? String 
    if text == ""
        false
    else
        first_capital = ( text[0] === text[0].upcase )
        end_with_mark = "?!.".include?(text[-1])
        first_capital && end_with_mark
    end
    
end