require_relative 'binary_tree.rb'

#Inorder successor of a node in binary tree is the next node in inorder traversal.
#Write a method to find inorder successor of a given binary tree node in binary search tree given parent pointers
def bst_inorder_successor
end

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

puts "root #{root}"

value = 25
puts "Inorder successor of #{value} is #{bst_inorder_successor(root, value)}"

value = 50
puts "Inorder successor of #{value} is #{bst_inorder_successor(root, value)}"

value = 75
puts "Inorder successor of #{value} is #{bst_inorder_successor(root, value)}"

value = 100
puts "Inorder successor of #{value} is #{bst_inorder_successor(root, value)}"

value = 125
puts "Inorder successor of #{value} is #{bst_inorder_successor(root, value)}"

value = 200
puts "Inorder successor of #{value} is #{bst_inorder_successor(root, value)}"

value = 350
puts "Inorder successor of #{value} is #{bst_inorder_successor(root, value)}"