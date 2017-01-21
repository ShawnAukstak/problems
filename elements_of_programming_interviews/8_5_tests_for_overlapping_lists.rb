require_relative '../coder_rust/linked_list.rb'


#Performance is O(n) where n is the length of the longer list of head_a and head_b
def first_common_node(head_a, head_b)
  length_a = list_length(head_a)
  length_b = list_length(head_b)

  #Advance the longer list so they are same length.
  while(length_a > length_b)
    head_a = head_a.next
    length_a -= 1
  end

  while(length_b > length_a)
    head_b = head_b.next
    length_b -= 1
  end

  #Advance in lock-step, return true if they match.
  while(head_a && head_b)
    return head_a if head_a == head_b

    head_a = head_a.next
    head_b = head_b.next
  end

  return nil
end

def list_length(head)
  length = 0

  while(head)
    head = head.next
    length += 1
  end

  length
end

head_a = LinkedListNode.new(1)
linked_list = LinkedList.new(head_a)
linked_list.insert(LinkedListNode.new(2))

shared_node = LinkedListNode.new(3)
linked_list.insert(shared_node)
linked_list.insert(LinkedListNode.new(4))
linked_list.insert(LinkedListNode.new(5))
linked_list.insert(LinkedListNode.new(6))

head_b = LinkedListNode.new(-10)
linked_list_b = LinkedList.new(head_b)
linked_list_b.insert(LinkedListNode.new(-9))
linked_list_b.insert(LinkedListNode.new(-8))
linked_list_b.insert(LinkedListNode.new(-7))
linked_list_b.insert(LinkedListNode.new(-6))
linked_list_b.insert(LinkedListNode.new(-5))
linked_list_b.insert(shared_node)

puts head_a
puts head_b

puts first_common_node(head_a, head_b)