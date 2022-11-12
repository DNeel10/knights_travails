# frozen_string_literal: true
require_relative './display'
require_relative './knight'

class Board
  include Display

  attr_accessor :board, :knight

  def initialize
    @board = create_board
    @knight = Knight.new
  end

  def create_board
    board = Array.new(8) {Array.new(8, ' ')}
    return board
  end

  def place_knight(position = [0, 1], knight = @knight)
    self.board[position[0]][position[1]] = 'N'
    knight.position = position
    return knight
  end

  def knight_move(final_position, position = knight.position)
    board[position[0]][position[1]] = ' '
    board[final_position[0]][final_position[1]] = 'N'
  end
end

gameboard = Board.new
puts "#{gameboard.display_board}"
gameboard.place_knight
puts "#{gameboard.display_board}"

gameboard.knight_move([2,2])
puts "#{gameboard.display_board}"


