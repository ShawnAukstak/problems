require_relative 'linked_list.rb'

def sorted_insert(head, node)
  return head if node.nil?

  if head.nil? || node.value <= head.value
    node.next = head
    return node
  end

  current_node = head
  while current_node.next && current_node.next.value < node.value
    current_node = current_node.next
  end

  node.next = current_node.next
  current_node.next = node

  return head
end

def linked_list_insertion_sort(head)
  sorted_head = nil
  current_node = head

  while current_node
    tmp = current_node.next
    sorted_head = sorted_insert(sorted_head, current_node)
    current_node = tmp
  end

  return sorted_head
end

head = LinkedListNode.new(29)
linked_list = LinkedList.new(head)
linked_list.insert(LinkedListNode.new(23))
linked_list.insert(LinkedListNode.new(82))
linked_list.insert(LinkedListNode.new(11))

puts "head: #{head}"
head = linked_list_insertion_sort(head)
puts "sorted_head: #{head}"
