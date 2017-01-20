require_relative '../coder_rust/linked_list.rb'


def reverse_linked_list(node)
  return if !node
  head = nil

  while node
    temp = node.next
    node.next = head
    head = node
    node = temp
  end

  head
end

head = LinkedListNode.new(1)
linked_list = LinkedList.new(head)
linked_list.insert(LinkedListNode.new(2))
linked_list.insert(LinkedListNode.new(3))

puts head
puts 'reverse!'
puts reverse_linked_list(head)