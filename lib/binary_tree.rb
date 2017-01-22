class BinaryTreeNode
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
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

    root.left = left
    root.right = right

    left = BinaryTreeNode.new(25)
    right = BinaryTreeNode.new(75)
    root.left.left = left
    root.left.right = right

    left = BinaryTreeNode.new(125)
    right = BinaryTreeNode.new(350)
    root.right.left = left
    root.right.right = right

    left = BinaryTreeNode.new(110)
    root.right.left.left = left

    root
  end
end