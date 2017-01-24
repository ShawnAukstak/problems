require_relative '../lib/linked_list.rb'


# input head
# output nil

# 0,1,2,3,4
# 0,2,4,1,3

#even 0
#odd 1

def even_odd_merge(head)
  return head if !head || !head.next

  even_tail, odd_tail = head, head.next
  odd_head = odd_tail

  while odd_tail.next
    even_tail.next = odd_tail.next
    even_tail = even_tail.next

    if even_tail.next
      odd_tail.next = even_tail.next
      odd_tail = odd_tail.next
    else
      odd_tail.next = nil
    end
  end

  even_tail.next = odd_head

  head
end

head = LinkedListNode.new(0)
linked_list = LinkedList.new(head)
linked_list.insert(LinkedListNode.new(1))
linked_list.insert(LinkedListNode.new(2))
linked_list.insert(LinkedListNode.new(3))
linked_list.insert(LinkedListNode.new(4))
linked_list.insert(LinkedListNode.new(5))
linked_list.insert(LinkedListNode.new(6))
linked_list.insert(LinkedListNode.new(7))
linked_list.insert(LinkedListNode.new(8))
linked_list.insert(LinkedListNode.new(9))
linked_list.insert(LinkedListNode.new(10))

puts even_odd_merge(head)