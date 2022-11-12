# frozen_string_literal: true

class Knight
  attr_accessor :position, :possible_moves

  def initialize(position = [0,1])
    @position = position

    @possible_moves = []
    
  end

  def build_move_tree(root = @position, move_list = @possible_moves)

    move_list << [root[0] + 1, root[1] + 2]
    move_list << [root[0] + 2, root[1] + 1]
    move_list << [root[0] - 1, root[1] - 2]
    move_list << [root[0] - 2, root[1] - 1]
    move_list << [root[0] + 1, root[1] - 2]
    move_list << [root[0] + 2, root[1] - 1]
    move_list << [root[0] - 1, root[1] + 2]
    move_list << [root[0] - 2, root[1] + 1]
    
    move_list.each_with_index do |move, i|
      move.each do |pos|
        move_list[i] = [] if pos.negative? || pos > 7
      end
    end

    return move_list
  end

end
knight = Knight.new
puts "#{knight.position}"
knight.build_move_tree([5,6])
p knight.possible_moves