require_relative 'binary_tree.rb'

#Inorder successor of a node in binary Search Tree (BST) is the next node
#in inorder traversal. Write a method to find the inorder successor of a given value "d" in a BST.

#Do InOrder traversal of tree, until we find value, then return the value
#This is Runtime of O(n), "naive solution"
def inorder_successor_bst_naive(root, value)
  return if root.nil?

  stack = Array.new
  successor_is_next = false

  while stack.length != 0 || root
    if root
      stack.push(root)
      root = root.left
    else
      root = stack.pop()
      return root.value if successor_is_next
      successor_is_next = (root.value == value)
      root = root.right
    end
  end
end

#Complete this in O(Log N) time
def inorder_successor_bst(root, value)
  return if root.nil?

  stack = Array.new

  successor = nil

  #Should function like a binary search, but populate the stack along the way.
  while(root.value != value)
    stack.push(root)

    if value < root.value
      successor = root #we might have pass the successor, keep track of these.
      root = root.left
    else
      root = root.right
    end
  end

  if root.right
    root = root.right
    until root.left.nil?
      root = root.left
    end

    successor = root
  end

  return successor
end

root = BinaryTreeNode.new(100)
left = BinaryTreeNode.new(50)
right = BinaryTreeNode.new(200)

root.left = left
root.right = right

left = BinaryTreeNode.new(25)
right = BinaryTreeNode.new(75)
root.left.left = left
root.left.right = right

left = BinaryTreeNode.new(125)
right = BinaryTreeNode.new(350)
root.right.left = left
root.right.right = right

puts "root #{root}"

value = 25
puts "Inorder successor of #{value} is #{inorder_successor_bst(root, value)}"

value = 50
puts "Inorder successor of #{value} is #{inorder_successor_bst(root, value)}"

value = 75
puts "Inorder successor of #{value} is #{inorder_successor_bst(root, value)}"

value = 100
puts "Inorder successor of #{value} is #{inorder_successor_bst(root, value)}"

value = 125
puts "Inorder successor of #{value} is #{inorder_successor_bst(root, value)}"

value = 200
puts "Inorder successor of #{value} is #{inorder_successor_bst(root, value)}"

value = 350
puts "Inorder successor of #{value} is #{inorder_successor_bst(root, value)}"
