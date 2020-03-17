require 'colorize'

class Error
  attr_reader :line, :type, :message

  def initialize(line)
    @line = line
  end

  def raise_line_length_warn
    @type = 'Warning'
    @message = 'The line is too long'
    colour_it
  end

  def raise_syntax_error(precision)
    @type = 'Error'
    @message = "Syntax error: #{precision}"
    colour_it
  end

  def raise_naming_error(precision)
    @type = 'Warning'
    @message = "Naming error: #{precision}"
    colour_it
  end

  def raise_preference(precision)
    @type = 'Warning'
    @message = "Preference: #{precision}"
    colour_it
  end

  def raise_closure_error(precision)
    @type = 'Error'
    @message = "Incoherent closures: #{precision}"
    colour_it
  end

  private

  def colour_it
    @type = if @type == 'Error'
              @type.red
            else
              @type.yellow
            end
    self
  end
end
