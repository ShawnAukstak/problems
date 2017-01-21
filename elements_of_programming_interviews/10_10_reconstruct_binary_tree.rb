require_relative '../lib/binary_tree.rb'
require 'pp'

#Reconstruct binary tree from traversal data

=begin
           100
     50            200
  25    75      125    350
             150
=end

def reconstruct_binary_tree(in_order, pre_order)
end

#input left,right, root indexes and in_order array
#output returns number of nodes to left and right:  { left: 3, right: 2}
def subtree_totals(left, right, root)
  node_count = Hash.new(0)

  node_count[:left] = root - left
  node_count[:right] = right - root 

  node_count
end


root = BinaryTree::sample
puts root

def pre_order_traversal(root, result)
  return if !root

  result << root.value

  if root.left
    pre_order_traversal(root.left, result)
  end

  if root.right
    pre_order_traversal(root.right, result)
  end
end

in_order = [25,50,75,100,150,125,200,350]
pre_order = []
pre_order_traversal(root, pre_order)

pp in_order
pp pre_order

puts reconstruct_binary_tree(in_order,pre_order)
