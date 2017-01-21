require_relative '../lib/binary_tree.rb'

#O(n) and space is O(h)
#Go down right and left through both trees in tandem, but mirror left/right.  If they do not match, return false.
def is_symmetric_binary_tree?(root)
  return true if !root

  is_symmetric_binary_tree_rec(root.left,root.right)
end

def is_symmetric_binary_tree_rec(left, right)
  return true if !left && !right

  if left && right
      return left.value == right.value &&
           is_symmetric_binary_tree_rec(left.left, right.right) &&
           is_symmetric_binary_tree_rec(left.right, right.left)
  end

  #Left or right is nil, therefore not mirror.
  return false
end

=begin
           100
     50            200
  25    75      125    350
             110
=end
root = BinaryTree::sample
puts root
puts is_symmetric_binary_tree?(root)


=begin
           100
       50       50
    25              25
=end
root = BinaryTreeNode.new(100)
left = BinaryTreeNode.new(50)
right = BinaryTreeNode.new(50)

root.left = left
root.right = right

left = BinaryTreeNode.new(25)
right = BinaryTreeNode.new(25)

root.left.left = left
root.right.right = right

puts is_symmetric_binary_tree?(root)