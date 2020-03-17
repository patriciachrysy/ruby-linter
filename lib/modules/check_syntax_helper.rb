require_relative '../error'

module CheckSyntaxHelper

    def self.error_shooter(line, message)
        error = Error.new(line)
        error.raise_syntax_error(message)
    end

    def self.check_cond_syntax(line)
        reg = Regexp.new("^[\s]*(if|unless)\s[\w]+[\s]*$")
        state = true
        unless reg.match?(line)
            state = self.error_shooter(line, "The condition declaration is incorrect, check it again")
        end
        state
    end

    def self.check_loop_syntax(line)
        reg = Regexp.new("^[\s]*(loop)\s(do|{(\W|\w)+})[\s]*$")
        state = true
        unless reg.match?(line)
            error = Error.new(line)
            state = self.error_shooter(line, "The loop declaration is incorrect, check it again")
        end
        state
    end

    def self.check_while_until_syntax(line)
        reg = Regexp.new("^[\s]*(while|until)\s(\w|\W)+[\s]*$")
        state = true
        unless reg.match?(line)
            error = Error.new(line)
            state = self.error_shooter(line, "The while/until declaration is incorrect, check it again")
        end
        state
    end

    def self.check_for_syntax(line)
        reg = Regexp.new("^[\s]*(for)\s(\w|\W)+\s(in)\s(\w|\W)+[\s]*$")
        state = true
        unless reg.match?(line)
            error = Error.new(line)
            state = self.error_shooter(line, "The for declaration is incorrect, check it again")
        end
        state
    end

    def self.check_times_syntax(line)
        reg = Regexp.new("^[\s]*(\W|\w)+\.times\s(do\s\|(\W|\w)+\||{(\W|\w)+})[\s]*$")
        state = true
        unless reg.match?(line)
            error = Error.new(line)
            state = self.error_shooter(line, "The times declaration is incorrect, check it again")
        end
        state
    end
end


