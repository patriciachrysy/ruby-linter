require_relative './helper'
class Board
  attr_reader :arr, :win_comb
  def initialize
    @arr = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @win_comb = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  end

  def filled_board
    res = true
    @arr.each do |elt|
      res = false unless elt.all?(String)
    end
    res
  end

  def update_board(position, player)
    res = check_pos(position)
    if res
      i = 0
      while i < @arr.length
        j = 0
        while j < @arr.length
          mark(i, j, position, player)
          j += 1
        end
        i += 1
      end
    end
    res
  end

  def display_board
    Helper.grid_display(@arr)
  end

  def win_comb?(choices)
    res = false
    @win_comb.each { |arr| res = true if arr - choices == [] }
    res
  end

  private

  def mark(index, sub_index, position, player)
    marked = false
    if @arr[index][sub_index] == position
      @arr[index][sub_index] = player.sign
      marked = true
    end
    marked
  end

  def check_pos(position)
    res = false
    @arr.each do |elt|
      res = true if elt.any?(position)
    end
    res
  end
end
