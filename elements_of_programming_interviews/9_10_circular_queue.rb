require 'rspec/autorun'

class CircularQueue

  DEFAULT_CAPACITY = 10

  def initialize(capacity = nil)
    @capacity = capacity
    @array = Array.new((capacity || DEFAULT_CAPACITY) - 1)
    @left = @array.size / 2
    @right = @array.size / 2
  end

  def enqueue(value)

    if dynamic_capacity?
      resize if size == @array.size
    else
      if (size + 1) > @capacity
        raise 'Queue Full'
      end
    end

    @array[@left] = value
    @left -= 1
  end

  def dequeue

    if @left <= @right
      value = @array[@right]
      @right -= 1
    end

    value
  end

  def size
    @right - @left
  end

  private

  #Ruby arrays don't actually have ability to be resized.
  #They are dynamic.  InC code that exist as dynamic resizing arrays, are resized autom
  #Just using 'fill' to simulate this behavior.
  def resize
    array = Array.new(@array.size * 2)

    (@left..@right).each do |i|
      array[i] = @array[i]
    end

    @array = array
  end

  def dynamic_capacity?
    @capacity.nil?
  end
end

RSpec.describe "CircularQueue" do
  describe "#size" do
    it "returns size of queue" do
      queue = CircularQueue.new
      queue.enqueue 1
      queue.enqueue 2
      queue.enqueue 3

      expect(queue.size).to eq 3
    end
  end

  describe "#enqueue" do
    it "adds elements to queue" do
      queue = CircularQueue.new

      expect(queue.size).to eq 0
      queue.enqueue 1
      expect(queue.size).to eq 1
    end

    it "limits size to capacity" do
      queue = CircularQueue.new(2)

      queue.enqueue 1
      queue.enqueue 2
      expect { queue.enqueue 3 }.to raise_error("Queue Full")
    end
  end

  describe "#dequeue" do
    it "removes elements from front of queue" do
      queue = CircularQueue.new
      queue.enqueue 4
      queue.enqueue 8

      expect(queue.size).to eq 2
      expect(queue.dequeue).to eq 4
      expect(queue.size).to eq 1
    end
  end
end