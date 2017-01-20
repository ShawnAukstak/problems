require_relative '../coder_rust/binary_tree.rb'
require 'pp'

#Runtime: O(n) O(n) - Do in_order and create array, then output last k nodes
#Runtime O(n) do inorder and measure size.

#This is always is O(n) runtime, because it completes full inorder traversal
def largest_values_brute(root, n)
  result = []
  largest_values_rec(root, result)
  result[(-1 * n)..-1]
end

def largest_values_rec(node, result)
  return if !node

  if node.left
    largest_values_rec(node.left, result)
  end

  result << node.value

  if node.right
    largest_values_rec(node.right, result)
  end
end

#Do reverse in_order traversal, this is O(k + h) because it stops once we're there, and tree might not be balanced.
def largest_values(root, k)
  result = []
  largest_values_rev_rec(root, result, k)
  result
end

def largest_values_rev_rec(node, result, k)
  return if !node
  return if result.length >= k

  puts 'call'
  if node.right
    largest_values_rev_rec(node.right, result, k)
  end

  return if result.length >= k

  result << node.value

  if node.left
    largest_values_rev_rec(node.left, result, k)
  end
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

pp largest_values(root, 4)
# puts largest_values_brute(root, 2)