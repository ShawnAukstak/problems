require_relative '../coder_rust/binary_tree.rb'

#Create array, then do binary_search, and get next element
#O(n) + O(n) memory

#Do a search, and save state
#performance O(h)
def bst_previous(node, n)
  return if !node

  next_so_far = nil
  while(node)

    if node.value >= n
      node = node.left
    else
      next_so_far = node
      node = node.right
    end
  end

  return next_so_far
end


=begin
     4
  2     8
1   3
=end

root = BinaryTreeNode.new(4)
left = BinaryTreeNode.new(2)
right = BinaryTreeNode.new(8)

root.left = left
root.right = right

root.left.left = BinaryTreeNode.new(1)
root.left.right = BinaryTreeNode.new(3)

result = bst_next_greater(root, 8)
puts result.value