require_relative 'linked_list.rb'

#Rotate a linked list by n (positive is right, negative is left)
def linked_list_rotate(head, n)
  return head if n == 0 || head.nil?

  length = 0
  curr = head

  until curr.nil?
    length += 1
    curr = curr.next
  end

  if n < 0
    n *= -1
  end

  if n >= length
    n = n - length
  end

  position = 1
  new_tail = nil
  curr = head

  until curr.nil?
    if (length - n ) == position
      new_tail = curr
    end

    if curr.next.nil?
      curr.next = head
      break
    end

    position += 1
    curr = curr.next
  end

  head = new_tail.next
  new_tail.next = nil

  return head
end

head = LinkedListNode.new(1)
linked_list = LinkedList.new(head)
linked_list.insert(LinkedListNode.new(2))
linked_list.insert(LinkedListNode.new(3))
linked_list.insert(LinkedListNode.new(4))
linked_list.insert(LinkedListNode.new(5))
puts "original list #{head}"
n = -6
puts "rotate list #{n} times is #{linked_list_rotate(head, n)}"