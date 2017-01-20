require_relative 'binary_tree.rb'

def identical_binary_trees?(root_a, root_b)
  if root_a.nil? && root_b.nil?
    return true
  elsif root_a.nil? != root_b.nil?
    return false
  end

  if root_a.value == root_b.value
    return identical_binary_trees?(root_a.left, root_b.left) && identical_binary_trees?(root_a.right, root_b.right)
  end

  return false
end

root = BinaryTreeNode.new(100)
left = BinaryTreeNode.new(50)
right = BinaryTreeNode.new(200)

root.left = left
root.right = right

left = BinaryTreeNode.new(25)
root.left.left = left

left = BinaryTreeNode.new(125)
right = BinaryTreeNode.new(350)
root.right.left = left
root.right.right = right

root_b = BinaryTreeNode.new(100)
left = BinaryTreeNode.new(50)
right = BinaryTreeNode.new(200)

root_b.left = left
root_b.right = right

left = BinaryTreeNode.new(25)
root_b.left.left = left

left = BinaryTreeNode.new(125)
right = BinaryTreeNode.new(350)
root_b.right.left = left
root_b.right.right = right

puts "root #{root}"
puts "root #{root_b}"

puts "identical #{identical_binary_trees?(root, root_b)}"


