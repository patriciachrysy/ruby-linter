require_relative 'line'

class RubyFile
  attr_reader :name, :lines
  def initialize(filename)
      @name = filename
      @lines =  []
      set_lines
  end

  def close_file
    File.close(@name)
  end

  private

  def open_file
    File.open(@name)
  end

  def set_lines
    file = open_file
    all_lines = file.readlines.map(&:chomp)
    all_lines.each_with_index do |value, index|
      line = Line.new(index+1, value, @name)
      @lines << line
    end
  end
end