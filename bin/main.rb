#!/usr/bin/env ruby

require_relative '../lib/modules/file_check'
require_relative '../lib/modules/lint_helper'

errors = []
if ARGV.length.positive?
  path = ARGV[0]
  regex = /^[\W|\w]+.rb$/
  if regex.match?(path)
    LintHelper.start_linting_file(path, errors)
  else
    LintHelper.start_linting_dir(path, errors)
  end
else
  files = FileCheck.content_ruby_files
  if !files.is_a?(String)
    LintHelper.lint_local(files, errors)
  else
    puts files
  end
end

if errors
  errors.each do |err|
    puts "#{err.type} in file #{err.line.filename}:on line #{err.line.number}, #{err.message}"
  end
  puts "#{errors.length} errors found"
end
