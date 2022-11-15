# frozen_string_literal: true
require_relative './knight'

class Board
  def initialize
    @knight = Knight.new
  end

  def bfs(pos = @knight.pos, target)
    queue = [Knight.new(target)]
    visited = []
    while queue.any?
      current_pos = queue.shift

      return visited if current_pos.pos == pos
      visited << current_pos unless visited.include?(current_pos)


      moves = possible_moves(current_pos.pos)
      moves.each do |move|
        queue << knight = Knight.new(move, current_pos) unless queue.include?(knight) || visited.include?(knight)
      end
      puts "length: #{visited}"
    end

  end

  def possible_moves(pos = @knight.pos, moves = @knight.moves)
    moves.map {|x, y| [pos[0] + x, pos[1] + y] }.
    select {|move| move.all? { |n| n >= 0 && n <= 7}}
  end

  def build_path(pos, target, visited)
    path = [target]
    
    until path.last == pos

    end
  end

end

board = Board.new

board.bfs([0,1], [3,3])

