require_relative '../coder_rust/linked_list.rb'


#runtime O(n)
def remove_kth_from_last_element(k, head)
  lead_node, node, prev  = head, head, nil

  #advance lead node k - 1 nodes ahead
  while k > 1
    return if !lead_node.next

    lead_node = lead_node.next
    k -= 1
  end

  #advance node and lead_node in tandem, keep track of prev
  while lead_node.next
    lead_node = lead_node.next

    prev = node
    node = node.next
  end

  #Delete by removing reference to node
  prev.next = node.next
end

head = LinkedListNode.new(1)
linked_list = LinkedList.new(head)
linked_list.insert(LinkedListNode.new(2))
linked_list.insert(LinkedListNode.new(3))
linked_list.insert(LinkedListNode.new(4))
linked_list.insert(LinkedListNode.new(5))
linked_list.insert(LinkedListNode.new(6))
linked_list.insert(LinkedListNode.new(7))
linked_list.insert(LinkedListNode.new(8))

puts head
remove_kth_from_last_element(3, head)
puts head
