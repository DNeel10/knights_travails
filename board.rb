# frozen_string_literal: true

require_relative './knight'

# Control the movement of the Knight class
class Board
  def initialize
    @knight = Knight.new
  end

  def bfs(pos = @knight.pos, target)
    queue = [Knight.new(target)]
    visited = []

    while queue
      current = queue.shift
      visited << current if visited.none? { |item| current == item }

      return build_path(target, visited) if current.pos == pos

      possible_moves(current.pos).each do |move|
        knight = Knight.new(move, current)
        queue << knight if queue.none? { |item| knight == item }
      end
    end
  end

  def possible_moves(pos = @knight.pos, moves = @knight.moves)
    moves.map { |x, y| [pos[0] + x, pos[1] + y] }
         .select { |move| move.all? { |n| n >= 0 && n <= 7 } }
  end

  def build_path(target, visited)
    path = []
    queue = []
    queue.push(visited.last)

    until path.last == target
      current = queue.shift
      path << current.pos
      queue << current.predecessor unless current.predecessor.nil?

    end
    print_path(path)
    path
  end

  def print_path(path)
    puts "Congratulations - You made it in #{path.length} moves"
    puts 'Your Path: '
    path.each { |link| puts "#{link}" }
  end
end

board = Board.new

board.bfs([0, 1], [7, 5])
