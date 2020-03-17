require_relative './check_naming_helper'
require_relative './check_syntax_helper'
require_relative './preference_helper'
require_relative './check_global_syntax_helper'

module LinesCheck
    def self.check_all(errors, line)
        self.check_length(errors, line)
        self.check_spacing(errors, line)
        self.check_endings(errors, line)
        self.check_syntax(errors, line)
        self.check_pref(errors, line)
        errors
    end

    def self.check_length(errors, line)
        unless line.check_length
            error = Error.new(line)
            errors << error.raise_line_length_warn
        end
        errors
    end

    def self.check_spacing(errors, line)
        line_res = CheckGlobalSyntaxHelper.check_spaces(line)
        errors << line_res if line_res
    end

    def self.check_endings(errors, line)
        if line.opening_line?
            class_patt = /^[\s]*(module|class)/
            if line.content.match?(class_patt)
                line_res = CheckNamingHelper.check_class_module(line)
                errors << line_res if line_res
            elsif line.content.match?(/^[\s]*(def)/)
                line_res = CheckNamingHelper.check_method_naming(line)
                errors << line_res if line_res
            end
        end
        errors
    end

    def self.check_syntax(errors, line)
        if line.content.include?('if') || line.content.include?('unless')
            line_res = CheckSyntaxHelper.check_cond_syntax(line)
            errors << line_res if line_res
        elsif line.content.include?('loop')
            line_res = CheckSyntaxHelper.check_loop_syntax(line)
            errors << line_res if line_res
        elsif line.content.include?('while') || line.content.include?('until')
            line_res = CheckSyntaxHelper.check_while_until_syntax(line)
            errors << line_res if line_res
        elsif line.content.include?('for')
            line_res = CheckSyntaxHelper.check_for_syntax(line)
            errors << line_res if line_res
        elsif line.content.include?('.times')
            line_res = CheckSyntaxHelper.check_times_syntax(line)
            errors << line_res if line_res
        end
        errors
    end

    def self.check_pref(errors, line)
        line_res = PreferenceHelper.each_against_for(line)
        errors << line_res if line_res
    end

end