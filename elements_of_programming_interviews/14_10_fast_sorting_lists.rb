require_relative '../coder_rust/linked_list.rb'
#9->2->5->4
#2->4->5->9


def list_merge_sort(head)
  return if !head
  return head if !head.next

  slow, fast = head, head
  while(fast && fast.next)
    prev_slow = slow
    slow = slow.next
    fast = fast.next.next
  end

  prev_slow.next = nil

  merge_linked_lists(list_merge_sort(head),list_merge_sort(slow))
end

#merges two linked lists in sorted order, returns new head
def merge_linked_lists(left_head, right_head)
  if !left_head
    return right_head
  end

  if !right_head
    return left_head
  end

  if left_head.value < right_head.value
    merged_head = left_head
    left_head = left_head.next
  else
    merged_head = right_head
    right_head = right_head.next
  end

  merged_tail = merged_head

  while(left_head && right_head)
    if left_head.value < right_head.value
      merged_tail.next = left_head
      left_head = left_head.next
    else
      merged_tail.next = right_head
      right_head = right_head.next
    end

    merged_tail = merged_tail.next
  end

  merged_tail.next = (left_head) ? left_head : right_head
  merged_head
end

left_head = LinkedListNode.new(0)
linked_list = LinkedList.new(left_head)
linked_list.insert(LinkedListNode.new(2))
linked_list.insert(LinkedListNode.new(4))

right_head = LinkedListNode.new(1)
linked_list = LinkedList.new(right_head)
linked_list.insert(LinkedListNode.new(3))
linked_list.insert(LinkedListNode.new(4))
puts merge_linked_lists(left_head,right_head)


head = LinkedListNode.new(9)
linked_list = LinkedList.new(head)
linked_list.insert(LinkedListNode.new(2))
linked_list.insert(LinkedListNode.new(5))
linked_list.insert(LinkedListNode.new(4))
linked_list.insert(LinkedListNode.new(0))

puts list_merge_sort(head)

