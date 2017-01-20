require_relative 'linked_list.rb'

#Given a singly linked list, reverse nodes at even indices.
def reverse_even_nodes(head)
  return head if head.nil? || head.next.nil?

  list_even = nil
  curr = head

  until curr.nil? || curr.next.nil?
    even = curr.next
    curr.next = curr.next.next

    even.next = list_even
    list_even = even

    curr = curr.next
  end

  puts head
  puts list_even

  reversed_head = nil
  curr = head

  #Go through list, alternating between adding from list_even
  until list_even.nil?
    next_odd = curr.next

    curr.next = list_even
    list_even = list_even.next

    curr.next.next = next_odd
    curr = next_odd
  end

  return head
end

head = LinkedListNode.new(7)
linked_list = LinkedList.new(head)
linked_list.insert(LinkedListNode.new(14))
linked_list.insert(LinkedListNode.new(21))
linked_list.insert(LinkedListNode.new(28))
linked_list.insert(LinkedListNode.new(9))

puts "original list #{head}"
reverse_even_nodes = reverse_even_nodes(head)
puts "reversed even nodes #{reverse_even_nodes}"