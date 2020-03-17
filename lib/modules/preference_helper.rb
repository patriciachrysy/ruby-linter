require_relative '../error'

module PreferenceHelper

    def self.error_shooter(line, message)
        error = Error.new(line)
        error.raise_preference(message)
    end

    def each_against_for(line)
        state = false
        if line.get_words.include?('for')
            state = self.error_shooter(line, "Prefer using 'each' instead of for")
        end
        state
    end


    def self_check_module(file)
        state = false
        pattern = Regexp.new("^[\s]+(class|module)")
        count = 0
        file.lines.each {|line| count += 1 if pattern.match?(line)}
        if count > 1
            last_line = file.lines[file.lines.length -1]
            state = self.error_shooter(last_line, "Do not define more than one class/module per file")
        end
        state
    end

end