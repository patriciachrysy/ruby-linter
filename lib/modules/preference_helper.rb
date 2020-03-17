require_relative '../error'

module PreferenceHelper
  def self.error_shooter(line, message)
    error = Error.new(line)
    error.raise_preference(message)
  end

  def self.each_against_for(line)
    state = false
    state = error_shooter(line, "Prefer using 'each' instead of for") if line.get_words.include?('for')
    state
  end

  def self.check_module(file)
    state = false
    pattern = /^[\s]*(class|module)/
    count = 0
    file.lines.each { |line| count += 1 if pattern.match?(line.content) }
    if count > 1
      last_line = file.lines[file.lines.length - 1]
      state = error_shooter(last_line, 'Do not define more than one class/module per file')
    end
    state
  end
end
