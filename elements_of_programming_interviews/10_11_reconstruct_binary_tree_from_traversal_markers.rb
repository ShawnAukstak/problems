require_relative '../lib/binary_tree.rb'


=begin
sequence:
[100,50,25,nil,nil,75,nil,nil,200,125,110,nil,nil,350,nil,nil]

  

=end

def reconstruct_tree(pre_order)
  return if pre_order.length == 0 || !pre_order[0]

  root = BinaryTreeNode.new(pre_order[0])
  i = reconstruct_tree_rec(1, root, pre_order, true)
  reconstruct_tree_rec(i + 1, root, pre_order, false)
  root
end

def reconstruct_tree_rec(i, parent, pre_order, is_left)
  if i > pre_order.length - 1 || !pre_order[i]
    return i
  end

  node = BinaryTreeNode.new(pre_order[i])

  if is_left
    parent.left = node
  else
    parent.right = node
  end

  #left
  i = reconstruct_tree_rec(i + 1, node, pre_order, true )

  #right
  i = reconstruct_tree_rec(i + 1, node, pre_order, false )

  i
end


=begin
           100
     50            200
  25    75      125    350
             110
=end
root = BinaryTree::sample
puts root

pre_order = [100,50,25,nil,nil,75,nil,nil,200,125,110,nil,nil,nil,350,nil,nil]
puts reconstruct_tree(pre_order)
