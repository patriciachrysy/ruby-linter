require_relative '../error'

module CheckSyntaxHelper
  def self.error_shooter(line, message)
    error = Error.new(line)
    error.raise_syntax_error(message)
  end

  def state_prec(tool)
    "The #{tool} declaration is incorrect, check it again"
  end

  def self.check_cond_syntax(line)
    reg = /^[\s|\w|\W]*(if|unless)\s[\w|\W]+[\s]*$/
    state = false
    state = error_shooter(line, state_prec('condition')) unless reg.match?(line.content)
    state
  end

  def self.check_loop_syntax(line)
    reg = /^[\s]*(loop)\s(do|{(\W|\w)+})[\s]*$/
    state = false
    state = error_shooter(line, state_prec('loop')) unless reg.match?(line.content)
    state
  end

  def self.check_while_until_syntax(line)
    reg = /^[\s]*(while|until)\s(\w|\W)+[\s]*$/
    state = false
    state = error_shooter(line, state_prec('while/until')) unless reg.match?(line.content)
    state
  end

  def self.check_for_syntax(line)
    reg = /^[\s]*(for)\s(\w|\W)+\s(in)\s(\w|\W)+[\s]*$/
    state = false
    state = error_shooter(line, state_prec('for')) unless reg.match?(line.content)
    state
  end

  def self.check_times_syntax(line)
    reg = /^[\s]*(\W|\w)+\.times\s(do\s\|(\W|\w)+\||{(\W|\w)+})[\s]*$/
    state = false
    state = error_shooter(line, state_prec('times')) unless reg.match?(line.content)
    state
  end
end
