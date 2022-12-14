class GrammarStats
    def initialize
        @check_arr = []
    end
  
    def check(text) # text is a string
      # Returns true or false depending on whether the text begins with a capital
      # letter and ends with a sentence-ending punctuation mark.
        fail "Please enter string!" unless text.is_a? String
        fail "String is empty!" if text == "" || text.match?(/^\s+$/)
        check = text[0] == text[0].upcase && ".?!".include?(text[-1])
        @check_arr.push(check)
        return check
    end
  
    def percentage_good
      # Returns as an integer the percentage of texts checked so far that passed
      # the check defined in the `check` method. The number 55 represents 55%.
        @check_arr.count(true) * 100 / @check_arr.count
    end
  end