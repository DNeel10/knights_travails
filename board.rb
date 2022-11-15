# frozen_string_literal: true
require_relative './knight'

class Board
  def initialize
    @knight = Knight.new
  end

  def bfs(pos = @knight.pos, target)
    queue = [Knight.new(target)]
    visited = []

    while queue
      current = queue.shift

      visited << current if visited.none? { |item| current == item}

      return build_path(pos, target, visited) if current.pos == pos

      moves = possible_moves(current.pos)
      moves.each do |move|
        knight = Knight.new(move, current)
        queue << knight if queue.none? { |item| knight == item}
      end
    end

  end

  def possible_moves(pos = @knight.pos, moves = @knight.moves)
    moves.map {|x, y| [pos[0] + x, pos[1] + y] }.
    select {|move| move.all? { |n| n >= 0 && n <= 7}}
  end

  def build_path(pos, target, visited)

    path = []
    queue = []
    queue.push(visited.last)

    until path.last == target
      current = queue.shift
      path << current.pos
      queue << current.predecessor unless current.predecessor.nil?

    end
    puts "Congratulations - You made it in #{path.length} moves"
    puts "your path: "
    p path
    path
  end

end

board = Board.new

board.bfs([0,1], [5,7])

