require_relative 'linked_list'

def remove_duplicates(head)

  #Go through linked list, but build a hash as we go through
  return if head.nil? || head.next.nil?

  values = Hash.new
  values[head.value] = true

  until head.next.nil?
    if values.has_key?(head.next.value)
      #remove duplicate node
      head.next = head.next.next
    else
      values[head.next.value] = true
      head = head.next
    end
  end
end

#7, 14, 21, 28
head = LinkedListNode.new(7)
linked_list = LinkedList.new(head)
linked_list.insert(LinkedListNode.new(14))
linked_list.insert(LinkedListNode.new(28))
linked_list.insert(LinkedListNode.new(14))
linked_list.insert(LinkedListNode.new(28))
linked_list.insert(LinkedListNode.new(21))

puts head
# reversed_head = reverse_singly_linked_list(linked_list.head)
puts "remove_duplicates"
remove_duplicates(head)

puts head