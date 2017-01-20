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

class LinkedList
  attr_accessor :head, :tail

  def initialize(head)
    raise "Linked list must be initialized with a node" unless head.is_a?(LinkedListNode)

    @head = head
    @tail = head
  end

  def insert(node)
    @tail.next = node
    @tail = @tail.next
  end

  #Print out all the values in the linked list in order
  def print
    current_node = @head

    until current_node.nil?
      puts "#{current_node.value} "

      current_node = current_node.next
    end
  end

  #iterate through the linked list in order and yield
  def iterate
    return unless block_given?

    current_node = @head

    until current_node.nil?
      yield current_node

      current_node = current_node.next
    end
  end
end

