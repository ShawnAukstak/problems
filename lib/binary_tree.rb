class BinaryTreeNode
  attr_accessor :value, :left, :right, :parent

  def initialize(value)
    @value = value
  end

  def add_left(node)
    @left = node
    node.parent = self
  end

  def add_right(node)
    @right = node
    node.parent = self
  end

  def to_s
    "{#{value}::#{left}|#{right}}"
  end
end

class BinaryTree

=begin
           100
     50            200
 25    75      125      350
             110
=end
  def self.sample
    root = BinaryTreeNode.new(100)
    left = BinaryTreeNode.new(50)
    right = BinaryTreeNode.new(200)

    root.add_left(left)
    root.add_right(right)

    left = BinaryTreeNode.new(25)
    right = BinaryTreeNode.new(75)
    root.left.add_left left
    root.left.add_right right

    left = BinaryTreeNode.new(125)
    right = BinaryTreeNode.new(350)
    root.right.add_left left
    root.right.add_right right

    left = BinaryTreeNode.new(110)
    root.right.left.add_left left

    root
  end
end