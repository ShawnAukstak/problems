require_relative 'binary_tree.rb'


#Delete zero sum sub_trees
def delete_zero_sum_sub_trees(root)
  return 0 if root.nil?

  left = right = 0

  left = delete_zero_sum_sub_trees(root.left)
  right = delete_zero_sum_sub_trees(root.right)

  if left == 0
    root.left = nil
  end

  if right == 0
    root.right = nil
  end

  sum = root.value + left + right

  return sum
end

root = BinaryTreeNode.new(7)
left = BinaryTreeNode.new(5)
right = BinaryTreeNode.new(6)

root.left = left
root.right = right

left = BinaryTreeNode.new(-3)
right = BinaryTreeNode.new(-2)
root.left.left = left
root.left.right = right

puts "root #{root}"
puts "delete zero sum #{delete_zero_sum_sub_trees(root)}"
puts "root #{root}"
