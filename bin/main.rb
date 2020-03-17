#!/usr/bin/env ruby

require_relative '../lib/ruby_file'
require_relative '../lib/modules/check_global_syntax_helper'

errors = []
if ARGV.length>0
    path = ARGV[0]
    puts path
    regex = /^[\W|\w]+.rb$/
    if regex.match?(path)
        puts "The path matches the regex"
        file = RubyFile.new(path)
        res = CheckGlobalSyntaxHelper.check_open_end(file)
        puts res
        error << res if res
    else
        #open the folder and loop
    end
else
    files = Dir["./**/*.rb"]
    #open and loop on files
end

puts errors.length
#errors.each {|err| puts err}