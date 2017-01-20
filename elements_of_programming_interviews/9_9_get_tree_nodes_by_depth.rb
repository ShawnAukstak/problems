require_relative '../coder_rust/binary_tree.rb'
require 'pp'

def tree_levels(root)
  current_level, next_level, result = Array.new, Array.new, Array.new
  level = 0
  temp = root

  while temp

    #Save result
    if result[level]
      result[level].push temp.value
    else
      result[level] = [temp.value]
    end

    if temp.left
      next_level.unshift temp.left
    end

    if temp.right
      next_level.unshift temp.right
    end

    if current_level.empty?
      current_level, next_level = next_level, current_level
      level += 1
    end

    temp = current_level.pop
  end

  result
end

def tree_levels_depth(root)
  results = Array.new
  tree_levels_depth_rec(root, 0, results)
  return results
end

def tree_levels_depth_rec(node, level, results)
  return if node.nil?

  if node.left
    tree_levels_depth_rec(node.left, level + 1, results)
  end

  if node.right
    tree_levels_depth_rec(node.right, level + 1, results)
  end

  if results[level]
    results[level].push node.value
  else
    results[level] = [node.value]
  end
end

root = BinaryTreeNode.new(1)
left = BinaryTreeNode.new(2)
right = BinaryTreeNode.new(3)

root.left = left
root.right = right

left = BinaryTreeNode.new(4)
right = BinaryTreeNode.new(5)

root.left.left = left
root.left.right = right

right = BinaryTreeNode.new(6)
root.right.right = right

pp tree_levels(root)
