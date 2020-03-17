class Line
  attr_reader :number, :content, :max_length, :filename

  def initialize(number, content, filename)
    @number = number
    @content = content
    @filename = filename
    @max_length = 80
  end

  def words
    @content.split
  end

  def check_syntax(regex)
    regex.match?(@content)
  end

  def check_include(word)
    @content.include?(word)
  end

  def check_length
    count = 0
    words.each { |word| count += word.length }
    count <= @max_length
  end

  def opening_line?
    ans = false
    pattern_one = /^[\s]*(module|class|def)/
    pattern_two = /^[\s]*[\W|\w]+\sdo/
    array = %w[while loop if unless until for]
    first = words[0]
    ans = true if pattern_one.match?(@content) || pattern_two.match?(@content) || array.include?(first)
    ans
  end

  def closing_line?
    pattern = /^[\s]*end[\s]*$/
    pattern.match?(@content) ? true : false
  end
end
