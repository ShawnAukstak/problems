require_relative 'linked_list'

#iterative approach runtime is O(n) and memory is O(1)
#Uses two cursors for new reversed head, and current_head..
#moves current_head through the list, setting each node to the reversed_head until the end
def reverse_singly_linked_list(head)


  current_head = head.next
  reversed_head = head
  reversed_head.next = nil

  until current_head.nil?
    temp = current_head
    current_head = temp.next

    temp.next = reversed_head
    reversed_head = temp
  end

  return reversed_head
end

def reverse_singly_linked_list_recursive(head)
  return head if head.nil? || head.next.nil?

  reversed_head = reverse_singly_linked_list_recursive(head.next)

  head.next.next = head
  head.next = nil

  return reversed_head
end

#7, 14, 21, 28
head = LinkedListNode.new(7)
linked_list = LinkedList.new(head)
linked_list.insert(LinkedListNode.new(14))
linked_list.insert(LinkedListNode.new(21))
linked_list.insert(LinkedListNode.new(28))
linked_list.print

# reversed_head = reverse_singly_linked_list(linked_list.head)
reversed_head = reverse_singly_linked_list_recursive(linked_list.head)
puts "Reverse!"

puts reversed_head

# linked_list.iterate do |node|
#   puts "iterate #{node.value}"
# end
