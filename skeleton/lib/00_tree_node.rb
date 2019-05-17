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

end