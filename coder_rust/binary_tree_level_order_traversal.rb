require_relative 'binary_tree.rb'

def binary_tree_level_order_traversal(root)
  return root if root.nil?

  current_queue = []
  next_queue = []

  next_queue.unshift(root)

  until next_queue.empty?

    until next_queue.empty?
      current_queue << next_queue.shift
    end

    until current_queue.empty?
      node = current_queue.shift
      print "#{node.value} "

      next_queue << node.left if node.left
      next_queue << node.right if node.right
    end

    puts "\n"
  end
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

puts "#{binary_tree_level_order_traversal(root)}"