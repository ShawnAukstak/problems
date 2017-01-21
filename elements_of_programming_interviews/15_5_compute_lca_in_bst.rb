require_relative '../lib/binary_tree.rb'


#Go down from root using each value, return the node when their paths diverge.
#O(h)

def least_common_ancestor_bst(root, node_a, node_b)
  while root
    if root.value > node_a.value && root.value > node_b.value
      #left
      root = root.left
    elsif root.value < node_a.value && root.value < node_b.value
      #right
      root = root.right
    else
      return root
    end
  end

  return nil
end

=begin
           100
     50            200
  25    75      125    350
             150
=end

root = BinaryTree::sample

node_a = root.left.left #25
node_b = root.right #200
puts least_common_ancestor_bst(root, node_a, node_b)

node_a = root.right.left.left #150
node_b = root.right.right #350
puts least_common_ancestor_bst(root, node_a, node_b)

node_a = root.right #200
node_b = root.right.right #350
puts least_common_ancestor_bst(root, node_a, node_b)