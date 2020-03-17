require_relative '../error'

module CheckNamingHelper

    def self.error_shooter(line, message)
        error = Error.new(line)
        error.raise_naming_error(message)
    end

    def self.check_class_module(line)
        reg = Regexp.new("^(class|module)\s[A-Z]{1}[a-z,A-Z]+[[\s]*$")
        state = true
        unless reg.match?(line)
            state = self.error_shooter(line, "The module and class names should repect the CamelCase, check it again")
        end
        state
    end

    def self.check_method_naming(line)
        reg = Regexp.new("^def\s[a-z]+(_[a-z]+)*[\s]*$")
        state = true
        unless reg.match?(line)
            state = self.error_shooter(line, "The method name should respect the namespacing syntax, check it again")
        end
        state
    end
end