require_relative '../coder_rust/binary_tree.rb'


=begin

  1
2

    1
  2
1
=end

#is balanced tree?
#input root node
#output true/false

def is_balanced_binary_tree?(root)
  is_balanced_rec(root) != -1
end

def is_balanced_rec(root)
  return 0 if root.nil?

  left_total, right_total = 1, 1

  if root.left
    left_total = is_balanced_rec(root.left)
  end

  if root.right
    left_total = is_balanced_rec(root.left)
  end

  if left_total == -1 || right_total == -1
    return -1
  end

  if (left_total - right_total).abs > 1
    return -1
  end

  left_total + right_total
end


root = BinaryTreeNode.new(1)
left = BinaryTreeNode.new(2)
right = BinaryTreeNode.new(3)

root.left = left
root.right = right

puts is_balanced_binary_tree?(root)
