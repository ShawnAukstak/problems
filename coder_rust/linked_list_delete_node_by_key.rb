require_relative 'linked_list.rb'

def linked_list_delete_node_by_key(head, key)
  return if head.nil?

  if head.value == key
    return head.next
  end

  current_node = head

  until current_node.next.nil?
    if current_node.next.value == key
      current_node.next = current_node.next.next
    end

    current_node = current_node.next
  end

  return head
end


#7, 14, 21, 28
head = LinkedListNode.new(7)
linked_list = LinkedList.new(head)
linked_list.insert(LinkedListNode.new(14))
linked_list.insert(LinkedListNode.new(28))
linked_list.insert(LinkedListNode.new(21))

puts head
# reversed_head = reverse_singly_linked_list(linked_list.head)
puts "remove_duplicates"
new_head = linked_list_delete_node_by_key(head, 28)

puts new_head