require_relative 'binary_tree.rb'
require_relative 'linked_list.rb'

#The below solution is correct, but unfortunately new nodes, is not done in place.
#In reality, we're creating a doubly linked list, but modify the trees left and right nodes
def convert_binary_tree_to_double_linked_list_with_aux(root)
  return if root.nil?

  stack = Array.new
  prev = nil
  head = nil

  while(stack.length > 0 || root)
    if root
      stack.push(root)
      root = root.left
    else
      root = stack.pop

      node = LinkedListNode.new(root.value)

      if head.nil?
        head = node
      end

      if prev
        prev.next = node
        node.prev = prev
      end

      prev = node

      root = root.right
    end
  end

  return head
end

#Use Divide and Conquer, keep in mind inorder flow (left, add, right)
def convert_binary_tree_to_double_linked_list(root)
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

right = BinaryTreeNode.new(60)
root.left.right.left = right

left = BinaryTreeNode.new(125)
right = BinaryTreeNode.new(350)
root.right.left = left
root.right.right = right

root = convert_binary_tree_to_double_linked_list(root)

while root
  puts root.value
  root = root.right
end
