require_relative 'binary_tree.rb'

class BinaryTreeNode
  attr_accessor :next
end

#Given the root node of a binary tree, print nodes forming the boundary (perimeter).
def binary_tree_connect_siblings(root)
  return if root.nil?

  current = last = root

  while current
    if (current.left)
      last.next = current.left
      last = current.left
    end

    if current.right
      last.next = current.right
      last = current.right
    end

    last.next = nil
    current = current.next
  end
end

root = BinaryTreeNode.new(1)
left = BinaryTreeNode.new(2)
right = BinaryTreeNode.new(3)

root.left = left
root.right = right

left = BinaryTreeNode.new(4)
right = BinaryTreeNode.new(5)
root.left.left = left
root.left.right = right

right = BinaryTreeNode.new(8)
root.left.right.right = right

left = BinaryTreeNode.new(9)
root.left.left.left = left

right = BinaryTreeNode.new(7)
root.right.right = right

right = BinaryTreeNode.new(10)
root.right.right.right = right

puts root
binary_tree_connect_siblings(root)