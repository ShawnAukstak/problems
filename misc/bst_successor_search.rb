=begin
Given a node n in a binary search tree, explain and code the most efficient way to find the successor of n.

Analyze the runtime complexity of your solution.

[4,6,7,8,10,12]

  6
4   10
   8   12
  7  11  13

n= 6
successor = 7

If you can go right, then go right, and the successor is the left most node.
else it's value of the last node where you made a left
save value when you make a left, used when value found and cannot go right

O(logn) - balanced
O(n)
=end

require_relative '../lib/binary_tree.rb'

def bst_successor_from_root(node, n)
  successor = nil
  found = false

  while node

    if n > node.value # 10 6
      node = node.right
    elsif n == node.value
      found = true
      node = node.right
    else
      successor = node.value
      node = node.left
    end

  end

  (found) ? successor : nil
end

def bst_successor(node)
  if node.right
    return find_min(node.right)
  end

  prev = node
  node = node.parent

  while node
    if node.left == prev
      return node.value
    end

    prev = node
    node = node.parent
  end

  return nil
end

def find_min(node)
  while node
    min = node.value
    node = node.left
  end

  min
end

=begin
           100
     50            200
  25    75      125    350
             110
=end

root = BinaryTree::sample

puts bst_successor_from_root(root, 100)
puts bst_successor_from_root(root, 200)
puts bst_successor_from_root(root, 75)
puts bst_successor_from_root(root, 220)
puts bst_successor_from_root(root, 350)

puts bst_successor(root.left)
puts bst_successor(root.right.left)



