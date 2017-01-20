require_relative '../coder_rust/linked_list.rb'
require 'pp'

def detect_cycle(head)
  return if !head || !head.next

  slow, fast = head, head

  slow = slow.next
  fast = fast.next.next

  #Detect Cycle
  while(slow != fast)
    if !fast || !fast.next
      return
    end

    fast = fast.next.next
    slow = slow.next
  end

  #Get cycle length
  cycle_length = 1
  fast = fast.next
  while(slow != fast)
    fast = fast.next
    cycle_length += 1
  end

  slow, fast = head, head

  #Position fast cycle_length ahead
  while cycle_length > 0
    fast = fast.next
    cycle_length -= 1
  end

  #Advance one at a time, when they meet we're at cycle head
  while (slow != fast)
    fast = fast.next
    slow = slow.next
  end

  return slow
end


head = LinkedListNode.new(1)
linked_list = LinkedList.new(head)
linked_list.insert(LinkedListNode.new(2))
linked_list.insert(LinkedListNode.new(3))

cycle = LinkedListNode.new(4)
last = LinkedListNode.new(8)

linked_list.insert(cycle)
linked_list.insert(LinkedListNode.new(5))
linked_list.insert(LinkedListNode.new(6))
linked_list.insert(LinkedListNode.new(7))
linked_list.insert(last)
last.next = cycle

cycle_head = detect_cycle(head)
puts cycle_head.value


