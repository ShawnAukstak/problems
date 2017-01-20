require_relative 'linked_list.rb'

#Given the head of a singly linked list and 'N', swap the head with Nth node. Return the head of the new linked list.
def linked_list_swap_nth_from_head(head, n)
  if head.nil? || n < 0
    return null
  end

  current_node = head
  node_position = 1

  until current_node.nil?
    if n == (node_position + 1)

      tmp = current_node.next
      second_node = head.next
      current_node.next = head
      head.next = tmp.next
      tmp.next = second_node

      return tmp
    end

    current_node = current_node.next
    node_position += 1
  end

  return nil
end

head = LinkedListNode.new(7)
linked_list = LinkedList.new(head)
linked_list.insert(LinkedListNode.new(14))
linked_list.insert(LinkedListNode.new(21))
linked_list.insert(LinkedListNode.new(28))
linked_list.insert(LinkedListNode.new(35))
linked_list.insert(LinkedListNode.new(42))

puts "Our list #{head}"
n = 3
puts "After Swapping #{n} elements from head with head #{linked_list_swap_nth_from_head(head, n)}"