require_relative 'linked_list.rb'

#Given a singly linked list and an integer 'k', reverse every 'k' elements.
#If k >= n (n is the length of linked list), then reverse the whole linked list.
def linked_list_reverse_k_elements(head, k)
  return head if k <=1 || head.nil?

  n = 0
  curr = head
  until curr.nil?
    n += 1
    curr = curr.next
  end

  k = n if k >= n

  curr = head
  previous_node = nil
  new_head = nil
  pos = 1

  until curr.nil?

    tmp = curr
    curr = curr.next
    tmp.next = new_head
    new_head = tmp

    #TODO Maintain additional pointers, reverse each segment, and link them together
  end

  return new_head
end

head = LinkedListNode.new(1)
linked_list = LinkedList.new(head)
linked_list.insert(LinkedListNode.new(2))
linked_list.insert(LinkedListNode.new(3))
linked_list.insert(LinkedListNode.new(4))
linked_list.insert(LinkedListNode.new(5))
linked_list.insert(LinkedListNode.new(6))

puts "original list #{head}"
n = 6
puts "reverse #{n} elements is #{linked_list_reverse_k_elements(head, n)}"