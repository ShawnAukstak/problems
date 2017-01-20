require_relative 'binary_tree.rb'

def mirror_binary_tree(root)
  #Use recursive post-order traversal.  Swap the left and right nodes.
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
puts "mirror #{mirror_binary_tree(root)}"