require_relative '../lib/binary_tree.rb'
require 'pp'

# [25, 50, 75, 100, 110, 125, 200, 350]
def reconstruct_bst_from_traversal(pre_order)
  reconstruct_bst_rec(0, pre_order.length - 1, pre_order)
end

def reconstruct_bst_rec(left, right, pre_order)
  return if left > right

  #Left most is our root
  root = BinaryTreeNode.new(pre_order[left])
  left += 1

  left_subtree_count = 0
  while ((left + left_subtree_count) <= right && pre_order[left + left_subtree_count] < root.value)
    left_subtree_count += 1
  end

  if left_subtree_count > 0
    root.left = reconstruct_bst_rec(left, left + left_subtree_count - 1, pre_order)
  end

  left += left_subtree_count

  #Remainder is in right subtree
  root.right = reconstruct_bst_rec(left, right, pre_order)

  root
end

def pre_order_traversal(node, results)
  return if !node

  results << node.value

  if node.left
    pre_order_traversal(node.left, results)
  end

  if node.right
    pre_order_traversal(node.right, results)
  end
end


=begin
           100
     50            200
 25    75      125      350
             110
=end

head =  BinaryTree::sample
pre_order = []
pre_order_traversal(head, pre_order)
pp pre_order


puts head
puts reconstruct_bst_from_traversal(pre_order)
