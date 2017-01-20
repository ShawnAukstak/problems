require_relative 'linked_list.rb'

#Takes head, and sets the head of the first half and second half in first_seconds
def split_in_half(head, first_second)
  if !head
    first_second.first = nil
    first_second.second = nil
    return
  end

  if !head.next
    first_second.first = head
    first_second.second = nil
  else

    slow = head
    fast = head.next

    until fast.nil?
      fast = fast.next

      unless fast.nil?
        fast = fast.next
        slow = slow.next
      end
    end

    first_second.first = head
    first_second.second = slow.next

    slow.next = nil
  end
end

#Takes head of two lists, and returns the head of the sorted merged list
def merge_sorted_lists(first, second)
  if !first
    return second
  end

  if !second
    return first
  end

  new_head = nil #Maintains reference to new_head, that is returned

  if first.value < second.value
    new_head = first
    first = first.next
  else
    new_head = second
    second = second.next
  end

  current_head = new_head
  until first.nil? && second.nil?
    if first.value < second.value
      current_head.next = first
      first = first.next
    else
      current_head.next = second
      second = second.next
    end
  end

  until second.nil?
    current_head.next = second
    second = second.next
  end

  until first.nil?
    current_head.next = first
    first = first.next
  end

  return new_head
end

def linked_list_merge_sort(head)
  #Escape case - No need to sort a single element
  if !head || !head.next
    return head
  end

  first = nil
  second = nil
  first_second = [first, second]

  split_in_half(head, first_second)

  first_second.first = linked_list_merge_sort(first_second.first)
  first_second.second = linked_list_merge_sort(first_second.second)

  return merge_sorted_lists(first_second.first, first_second.second)
end

head = LinkedListNode.new(29)
linked_list = LinkedList.new(head)
linked_list.insert(LinkedListNode.new(23))
linked_list.insert(LinkedListNode.new(82))
linked_list.insert(LinkedListNode.new(11))
linked_list.insert(LinkedListNode.new(4))
linked_list.insert(LinkedListNode.new(3))
linked_list.insert(LinkedListNode.new(21))

puts "Unsorted list #{head}"
head = linked_list_merge_sort(head)
puts "Sorted list #{head}"