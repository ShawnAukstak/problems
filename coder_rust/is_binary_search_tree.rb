require_relative 'binary_tree.rb'

def is_binary_search_tree(root)
  return true if root.nil?

  output = Array.new
  stack = Array.new

  while (stack.length > 0 || root)
    if root
      stack.push(root)
      root = root.left
    else
      root = stack.pop
      output << root.value
      root = root.right
    end
  end

  #-2 to Skip last element
  for x in 0..(output.length - 2)
    return false if output[x] > output[x + 1]
  end

  return true
end

#Another, more efficient version compared to the above is just keep track of the previous seen value
#Then compare the current to the previous seen.. while same Big Oh, requires same runtime and memory efficiency.

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

puts "Is Binary Seach Tree? #{root} #{is_binary_search_tree(root)}"

root = BinaryTreeNode.new(100)
left = BinaryTreeNode.new(50)
right = BinaryTreeNode.new(200)

root.left = left
root.right = right

left = BinaryTreeNode.new(25)
right = BinaryTreeNode.new(75)
root.left.left = left
root.left.right = right

left = BinaryTreeNode.new(90)
right = BinaryTreeNode.new(350)
root.right.left = left
root.right.right = right

puts "Is Binary Seach Tree? #{root} #{is_binary_search_tree(root)}"

root = BinaryTreeNode.new(100)
left = BinaryTreeNode.new(50)
right = BinaryTreeNode.new(200)

root.left = left
root.right = right

left = BinaryTreeNode.new(25)
right = BinaryTreeNode.new(110)
root.left.left = left
root.left.right = right

left = BinaryTreeNode.new(125)
right = BinaryTreeNode.new(350)
root.right.left = left
root.right.right = right

puts "Is Binary Seach Tree? #{root} #{is_binary_search_tree(root)}"