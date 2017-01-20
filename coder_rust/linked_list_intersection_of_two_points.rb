require_relative 'linked_list.rb'

#Given head nodes of two linked lists that may or may not intersect, 
#find out if they intersect and return the point of intersection; return null otherwise.
def linked_list_insection_of_two_lists_brute(a, b)
  if a.nil? || b.nil?
    return nil
  end

  until a.nil?

    tmp = b
    until b.nil?

      if (a == b)
        return a
      end

      b = b.next
    end

    b = tmp #reset b back to it's head
    a = a.next
  end


  return nil
end

def linked_list_insection_of_two_lists(a, b)

  return nil
end

head_a = LinkedListNode.new(29)
linked_list_a = LinkedList.new(head_a)
linked_list_a.insert(LinkedListNode.new(23))
linked_list_a.insert(LinkedListNode.new(82))
linked_list_a.insert(LinkedListNode.new(11))

head_b = LinkedListNode.new(112)
linked_list_b = LinkedList.new(head_b)
linked_list_b.insert(LinkedListNode.new(115))
linked_list_b.insert(LinkedListNode.new(129))
linked_list_b.insert(LinkedListNode.new(150))

puts "intersection brute check 1 #{linked_list_insection_of_two_lists_brute(head_a, head_b)}"
puts "intersection check 1 #{linked_list_insection_of_two_lists(head_a, head_b)}"

head_a = LinkedListNode.new(29)
linked_list_c = LinkedList.new(head_a)
linked_list_c.insert(LinkedListNode.new(23))
linked_list_c.insert(LinkedListNode.new(82))
linked_list_c.insert(LinkedListNode.new(11))

head_b = LinkedListNode.new(13)
linked_list_b = LinkedList.new(head_b)
linked_list_b.insert(LinkedListNode.new(4))

shared_a = LinkedListNode.new(12)
linked_list_c.tail.next = shared_a
linked_list_b.tail.next = shared_a

puts head_a
puts head_b

puts "intersection brute check 2 #{linked_list_insection_of_two_lists_brute(head_a, head_b)}"
puts "intersection check 2 #{linked_list_insection_of_two_lists(head_a, head_b)}"