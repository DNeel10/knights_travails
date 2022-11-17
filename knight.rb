# frozen_string_literal: true

# Node style class to stores information about a knight
class Knight
  attr_accessor :pos, :moves, :predecessor

  def initialize(pos = [0, 1], predecessor = nil)
    @pos = pos
    @predecessor = predecessor
    @moves = [[-2, -1], [-2, 1], [2, -1], [2, 1], [1, -2], [1, 2], [-1, -2], [-1, 2]]
  end

  def ==(other)
    @pos == other.pos
  end
end
