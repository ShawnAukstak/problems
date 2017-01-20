require_relative 'linked_list.rb'

#Takes head, and sets the head of the first half and second half in first_seconds
def merge_two_sorted_list(first, second)

  #Check if both, or one are nil
  return if first.nil? && second.nil?
  return second if first.nil?
  return first if second.nil?

  if first.value < second.value
    sorted_head = first
    first = first.next
  else
    sorted_head = second
    second = second.next
  end

  current_head = sorted_head

  until first.nil? || second.nil?
    if first.value < second.value
      current_head.next = first
      first = first.next
    else
      current_head.next = second
      second = second.next
    end

     current_head = current_head.next
  end

  until first.nil?
    current_head.next = first
    current_head = current_head.next
    first = first.next
  end

  until second.nil?
    current_head.next = second
    current_head = current_head.next
    second = second.next
  end

  return sorted_head
end

first = LinkedListNode.new(4)
linked_list = LinkedList.new(first)
linked_list.insert(LinkedListNode.new(8))
linked_list.insert(LinkedListNode.new(15))
linked_list.insert(LinkedListNode.new(19))

second = LinkedListNode.new(7)
linked_list = LinkedList.new(second)
linked_list.insert(LinkedListNode.new(9))
linked_list.insert(LinkedListNode.new(10))
linked_list.insert(LinkedListNode.new(16))

puts "first list #{first}"
puts "second list #{second}"

sorted_head = merge_two_sorted_list(first, second)

puts "sorted #{sorted_head}"