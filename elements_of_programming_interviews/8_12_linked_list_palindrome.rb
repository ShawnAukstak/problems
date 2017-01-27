require_relative '../coder_rust/linked_list.rb'



#Use Slow/Fast, have slow assemble Stack.
#Once fast hits end, then walk Slow one step at a time, comparing to stack.pop, if !=, then false
#O(n), O(n)

#Instead of using stack, slow leaves behind a reversed list that we use to check later.
#O(n), O(1)
def is_list_palindrome?(head)
  slow, fast = head, head
  reversed_head = nil

  while (fast && fast.next)
    fast = fast.next.next

    prev = slow
    slow = slow.next
    prev.next = reversed_head
    reversed_head = prev
  end

  if fast
    slow = slow.next
  end

  while(slow)
    return false if slow.value != reversed_head.value

    slow = slow.next
    reversed_head = reversed_head.next
  end

  true
end

head = LinkedListNode.new("R")
linked_list = LinkedList.new(head)
linked_list.insert(LinkedListNode.new("A"))
linked_list.insert(LinkedListNode.new("C"))
linked_list.insert(LinkedListNode.new("E"))
linked_list.insert(LinkedListNode.new("C"))
linked_list.insert(LinkedListNode.new("A"))
linked_list.insert(LinkedListNode.new("R"))

puts head
puts is_list_palindrome?(head)

head = LinkedListNode.new("R")
linked_list = LinkedList.new(head)
linked_list.insert(LinkedListNode.new("X"))

puts head
puts is_list_palindrome?(head)

head = LinkedListNode.new("N")
linked_list = LinkedList.new(head)
linked_list.insert(LinkedListNode.new("O"))
linked_list.insert(LinkedListNode.new("O"))
linked_list.insert(LinkedListNode.new("N"))

puts head
puts is_list_palindrome?(head)
