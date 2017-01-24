require_relative '../lib/binary_tree.rb'

#Complete In Order Traversal of binary tree using O(1) space.  Nodes have Parent links
#More elegent solution exists here.
#Key is to keep track of the previous node to determine if we came from parent or which subtree.
def in_order_traversal(node)

  while node

    #Left as far as possible
    while(node.left)
      node = node.left
    end

    print "#{node.value} "

    prev = node
    node = node.parent

    while node
      if node.left == prev
        print "#{node.value} "

        if node.right
          node = node.right
          break
        end
      end

      prev = node
      node = node.parent
    end

  end
end

=begin
           100
     50            200
  25    75      125    350
             110
=end
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

left = BinaryTreeNode.new(110)
root.right.left.add_left left

puts root
puts in_order_traversal(root)