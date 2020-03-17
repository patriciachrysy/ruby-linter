require_relative '../ruby_file'
require_relative './file_check'
require_relative './lines_check'

module LintHelper
    def self.start_linting_file(path, errors)
        if FileCheck.file_exist(path)==true
            linting(path, errors)
        else
            puts FileCheck.file_exist(path)
        end
    end
    
    def self.start_linting_dir(path, errors)
        if FileCheck.dir_exist(path)==true
            files = FileCheck.content_ruby_files(path)
            unless files.is_a?(String)
                files.each{|file| linting(file, errors)}
            else
                puts files
            end
        else
            puts FileCheck.dir_exist(path)
        end
    end
    
    def self.lint_local(files, errors)
        files.each{|file| linting(file, errors)}
    end
    
    def self.linting(path, errors)
        file = RubyFile.new(path)
        FileCheck.check_file(errors, file)
        file.lines.each {|line| errors = LinesCheck.check_all(errors, line)}
    end
end