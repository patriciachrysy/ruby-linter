class Line
    attr_reader :number, :content, :max_length, :filename

    def initialize(number, content, filename)
        @number = number
        @content = content
        @filename = filename
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
        pattern_one = /^[\s]*(module|class|def)/
        pattern_two = /^[\s]*[\W|\w]+\sdo/
        array = ['while', 'loop', 'if', 'unless', 'until', 'for']
        first = self.get_words[0]
        if pattern_one.match?(@content) || pattern_two.match?(@content) || array.include?(first)
            ans = true
        end
        ans
    end

    def closing_line?
        pattern = /^[\s]*end[\s]*$/
        pattern.match?(@content) ? true : false
    end
end