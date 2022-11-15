# frozen_string_literal: true

class Knight
  attr_accessor :pos, :moves, :children, :predecessor
  def initialize(pos = [0,1], predecessor = nil)
    @pos = pos
    @predecessor = predecessor
    @moves = [[-2, -1], [-2, 1], [2, -1], [2, 1], [1, -2], [1, 2], [-1, -2], [-1, 2]]

  end

  def ==(other)
    @pos == other.pos
  end
end

# knight = Knight.new([5,7])

