require_relative 'linked_list.rb'

#Given a singly linked list, return nth from last node. Return null if 'n' is out-of-bounds.
def linked_list_from_last_node(head, n)
  current_n = head
  gap = 0

  until current_n.nil?
    if gap == n
      head = head.next
      return head if current_n.next.nil?
    else
      gap += 1
    end

    current_n = current_n.next
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
puts "3rd from the end #{linked_list_from_last_node(head, 5)}"