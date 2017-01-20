require_relative 'linked_list.rb'

#Given head pointers of two linked lists where each linked list represents 
#an integer number (each node is a digit), add them and return the resulting linked list.
#Fist node represents least significant digit
#1-0-9-9
#7-3-2
#results in 8-3-1-0-1
def linked_list_add_two_integers(head_a, head_b)
  return head_b if head_a.nil?
  return head_a if head_b.nil?

  sum = head_a.value + head_b.value
  carry = 0
  if sum >= 10
    sum = sum % 10
    carry = 1
  end

  head_a = head_a.next
  head_b = head_b.next

  result_head = LinkedListNode.new(sum)
  result_tail = result_head

  until head_a.nil? && head_b.nil?
    digit_a = 0
    digit_b = 0

    unless head_a.nil?
      digit_a = head_a.value
      head_a = head_a.next
    end

    unless head_b.nil?
      digit_b = head_b.value
      head_b = head_b.next
    end

    sum = digit_a + digit_b + carry

    if sum >= 10
      sum = sum % 10
      carry = 1
    else
      carry = 0
    end

    result_tail.next = LinkedListNode.new(sum)
    result_tail = result_tail.next
  end

  if carry > 0
    result_tail.next = LinkedListNode.new(carry)
    result_tail = result_tail.next
  end

  return result_head
end

head_a = LinkedListNode.new(1)
linked_list = LinkedList.new(head_a)
linked_list.insert(LinkedListNode.new(0))
linked_list.insert(LinkedListNode.new(9))
linked_list.insert(LinkedListNode.new(9))

head_b = LinkedListNode.new(7)
linked_list = LinkedList.new(head_b)
linked_list.insert(LinkedListNode.new(3))
linked_list.insert(LinkedListNode.new(2))

puts "First List #{head_a}"
puts "Second List #{head_b}"
puts "Summed List #{linked_list_add_two_integers(head_a, head_b)}"

