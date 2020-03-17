class Line
    attr_reader :number, :content, :max_length

    def initialize(number, content)
        @number = number
        @content = content
        @max_length = 80
    end

    def get_words
        @content.split
    end

    def check_syntax(regex)
        regex.match?(@content)
    end

    def check_include(word)
        @content.include?(word)
    end

    def check_length
        count = 0
        self.get_words.each {|word| count+=word.length}
        count<=@max_length ? true : false
    end

    def opening_line?
        ans = false
        partern_one = Regexp.new("^(module|class|def)")
        pattern_two = Regexp.new("^[\s]*[\W|\w]+\sdo")
        array = ['while', 'loop', 'if', 'unless', 'until']
        first = self.get_words[0]
        if partern_one.match?(@content) || partern_two.match?(@content) || array.include?(first)
            ans = true
        end
        ans
    end

    def closing_line?
        partern = Regexp.new("^[\s]*end[\s]*$")
        partern.match?(@content) ? true : false 
    end
end