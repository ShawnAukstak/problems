require_relative 'binary_tree.rb'

#Find nth highest node in a Binary Search Tree(BST).
#O(N) speed is achieved here because it needs to crawl the entire tree, everytime.
def bst_nth_highest_value_naive(root, value)
  return if root.nil?

  stack = Array.new
  inorder = Array.new

  while(stack.length > 0 || root)
    if root
      stack.push(root)
      root = root.left
    else
      root = stack.pop
      inorder << root.value
      root = root.right
    end
  end

  return inorder[inorder.length - value]
end

#Crawl tree in reverse order.
#Still linear big Oh, but must better worst case scenerio.
def bst_nth_highest_value(root, value)
  return if root.nil?

  stack = Array.new
  counter = 0

  while(stack.length > 0 || root)
    if root
      stack.push(root)
      root = root.right
    else
      root = stack.pop
      counter += 1
      return root.value if counter == value
      root = root.left
    end
  end

  return
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

value = 1
puts "#{value}th highest value is #{bst_nth_highest_value(root, value)}"

value = 2
puts "#{value}th highest value is #{bst_nth_highest_value(root, value)}"

value = 3
puts "#{value}th highest value is #{bst_nth_highest_value(root, value)}"

value = 4
puts "#{value}th highest value is #{bst_nth_highest_value(root, value)}"

value = 5
puts "#{value}th highest value is #{bst_nth_highest_value(root, value)}"
