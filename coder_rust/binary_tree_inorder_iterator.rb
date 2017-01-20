require_relative 'binary_tree.rb'

# Write inorder traversal of a binary tree iteratively.
def binary_tree_inorder_iterative(root)
  return if root.nil?

  stack = Array.new

  while (stack.length != 0 || root)
    if root
      stack.push(root)
      root = root.left
    else
      root = stack.pop()
      print "#{root.value} "
      root = root.right
    end
  end
end

def binary_tree_postorder_recursive(root)
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

# root_b = BinaryTreeNode.new(100)
# left = BinaryTreeNode.new(50)
# right = BinaryTreeNode.new(200)

# root_b.left = left
# root_b.right = right

# left = BinaryTreeNode.new(25)
# root_b.left.left = left

# left = BinaryTreeNode.new(125)
# right = BinaryTreeNode.new(350)
# root_b.right.left = left
# root_b.right.right = right

puts "root #{root}"

puts "#{binary_tree_inorder_iterative(root)}"