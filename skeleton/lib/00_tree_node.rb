require "byebug"

class PolyTreeNode

  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    @parent.children.delete_at(@parent.children.find_index(self)) unless @parent.nil?
    @parent = node
    node.children << self unless node.nil? || node.children.include?(self)
  end

  def add_child(node)
    node.parent = self
    @children << node unless @children.include?(node)
  end

  def remove_child(node)
    node.parent = nil
    raise "Node is not a child." unless @children.include?(node)
  end

  def dfs(target_val)
    # debugger
    return self if self.value == target_val
    
    self.children.each do |child|
      store = child.dfs(target_val)
      return store unless store.nil?
    end

    nil
  end

  def bfs(target_val)
    queue = [self]

    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target_val
      current_node.children.each { |child| queue.push(child) }
    end
    
    nil
  end
end

n5 = PolyTreeNode.new(5)
n4 = PolyTreeNode.new(4)
n3 = PolyTreeNode.new(3)
n2 = PolyTreeNode.new(2)
n1 = PolyTreeNode.new(1)

n4.parent = n3
n5.parent = n3
n3.parent = n2
n2.parent = n1

p n1.bfs(5)
