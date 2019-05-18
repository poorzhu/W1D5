require_relative 'lib/00_tree_node.rb'
require 'byebug'
class KnightPathFinder

  def initialize
    @considered_positions = []
    @root_node = [Polytree]
  end

  def self.valid_moves(pos)
    @considered_positions << pos
    moves = [[2,1],[2,-1],[-2,1],[-2,-1],[1,2],[-1,2],[1,-2],[-1,-2]]
    possible_moves = moves.map { |move| [move[0] + pos[0],move[1] + pos[1]] } # find better function
    possible_moves.select do |possible_move|
      possible_move.all? { |idx| idx <= 7 && idx >= 0 }
    end
  end

  def new_move_positions(pos)
    KnightPathFinder.valid_moves.select {|valid_move| @considered_positions.include?(valid_move)}
  end

  def build_move_tree()
    
  end



end