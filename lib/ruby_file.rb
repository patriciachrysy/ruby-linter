require_relative 'line'

class RubyFile
  attr_reader :name, :lines
  def initialize(filename)
      @name = filename
      @lines =  []
      self.set_lines
  end

  def close_file
    File.close(@filename)
  end

  private

  def open_file
    File.open(@filename)
  end

  def set_lines
    file = self.open_file
    all_lines = file.readlines.map(&:chomp)
    all_lines.each_with_index do |value, index|
      line = Line.new(index, value)
      @lines << line
    end
  end
end