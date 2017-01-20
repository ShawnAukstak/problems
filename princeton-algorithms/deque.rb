# public class Deque<Item> implements Iterable<Item> {
#    public Deque()                           // construct an empty deque
#    public boolean isEmpty()                 // is the deque empty?
#    public int size()                        // return the number of items on the deque
#    public void addFirst(Item item)          // add the item to the front
#    public void addLast(Item item)           // add the item to the end
#    public Item removeFirst()                // remove and return the item from the front
#    public Item removeLast()                 // remove and return the item from the end
#    public Iterator<Item> iterator()         // return an iterator over items in order from front to end
#    public static void main(String[] args)   // unit testing
# }


class Deque
  def initialize
    @deque = Array.new
  end

  def empty?
    @deque.empty?
  end

  def size
    @deque.size
  end

  def add_first(item)
    @deque.unshift(item)
  end

  def add_last(item)
    @deque.push(item)
  end

  def remove_first
    @deque.shift
  end

  def remove_last
    @deque.pop
  end

  def iterator
    @deque
  end
end


deque = Deque.new
deque.add_last(1)
deque.add_last(2)
deque.add_last(3)
deque.add_last(4)
deque.add_first(0)
puts deque.remove_first
puts deque.remove_last

#puts deque.iterator



