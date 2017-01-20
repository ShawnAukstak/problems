class LinkedListNode
  attr_accessor :value, :next, :prev

  def initialize(value)
    @value = value
  end

  def to_s
    curr_node = self
    res = "["
    while curr_node.next != nil
      res = res + curr_node.value.to_s + ", " 
      curr_node = curr_node.next
    end
    res = res + curr_node.value.to_s + "]"
  end
end


def merge_lists(head_a, head_b)
  return nil if head_a.nil? && head_b.nil?
  return head_a if head_b.nil?
  return head_b if head_a.nil?

  if head_a.value < head_b.value
    merged_head = head_a
    head_a = head_a.next
  else
    merged_head = head_b
    head_b = head_b.next
  end

  merged_head.next = nil
  tail = merged_head

  while head_a && head_b
    if head_a.value < head_b.value
      tail.next = head_a
      head_a = head_a.next
    else
      tail.next = head_b
      head_b = head_b.next
    end

    tail = tail.next
    tail.next = nil
  end

  tail.next = (head_a) ? head_a : head_b

  merged_head
end

head_a = LinkedListNode.new(3)
head_a.next = LinkedListNode.new(11)

head_b = LinkedListNode.new(2)
head_b.next = LinkedListNode.new(5)
head_b.next.next = LinkedListNode.new(7)

puts head_a
puts head_b
puts merge_lists(head_a, head_b)