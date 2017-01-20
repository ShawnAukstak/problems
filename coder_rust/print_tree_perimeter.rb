require_relative 'binary_tree.rb'

#Given the root node of a binary tree, print nodes forming the boundary (perimeter).
def print_tree_perimeter(root)
  print "print"
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
print_tree_perimeter(root)