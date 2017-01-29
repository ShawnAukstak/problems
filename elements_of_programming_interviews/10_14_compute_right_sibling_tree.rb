require_relative '../lib/binary_tree.rb'

=begin
Add "next" to each node, which is set to node to its right at same level:
           100
     50            200
  25    75      125    350

e.g.
node 50.next = 200
node 200.next = nil
node 25.next = 75
=end

class BinaryTreeNode
  attr_accessor :next
end

#O(n) time/space
def compute_right_sibling_tree_brute(root)
  queue = []
  node = { node: root, level: 0 }

  while(node)

    if node[:node].left
      queue.unshift({ node: node[:node].left, level: node[:level] + 1 })
    end

    if node[:node].right
      queue.unshift({ node: node[:node].right, level: node[:level] + 1 })
    end

    temp = queue.pop
    if temp && temp[:level] == node[:level]
      node[:node].next = temp[:node]
    end

    node = temp
  end
end

def compute_right_sibling_tree(node)

  while node
    setup_next(node)
    node = node.left
  end
end

def setup_next(node)

  while node && node.left
    node.left.next = node.right

    if node.next && node.right
      node.right.next = node.next.left
    end

    node = node.next
  end
end

root = BinaryTreeNode.new(100)
left = BinaryTreeNode.new(50)
right = BinaryTreeNode.new(200)

root.add_left(left)
root.add_right(right)

left = BinaryTreeNode.new(25)
right = BinaryTreeNode.new(75)
root.left.add_left left
root.left.add_right right

left = BinaryTreeNode.new(125)
right = BinaryTreeNode.new(350)
root.right.add_left left
root.right.add_right right

compute_right_sibling_tree_brute(root)
puts root.left.next
puts root.right.next
puts root.left.left.next


root = BinaryTreeNode.new(100)
left = BinaryTreeNode.new(50)
right = BinaryTreeNode.new(200)

root.add_left(left)
root.add_right(right)

left = BinaryTreeNode.new(25)
right = BinaryTreeNode.new(75)
root.left.add_left left
root.left.add_right right

left = BinaryTreeNode.new(125)
right = BinaryTreeNode.new(350)
root.right.add_left left
root.right.add_right right

compute_right_sibling_tree(root)
puts root.left.next
puts root.right.next
puts root.left.left.next

