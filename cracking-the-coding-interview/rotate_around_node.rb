require 'rspec/autorun'

class Node
  attr_accessor :next, :value

  def initialize(value)
    @value = value
  end
end

def pivot_around_node(head, value)
  return if head.nil?

  pivot = nil
  node = head

  until node.nil?
    if node.value == value
      pivot = node
      break
    end

    node = node.next
  end

  return if pivot.nil?

  new_head = nil
  node = head

  until node.nil?

    node = node.next
  end

  return new_head
end

RSpec.describe "pivot_around_node" do
  it "Moves all nodes less than value to left and greater to right" do
    #4->1->3->2->5
    head = Node.new(4)
    second = Node.new(1)
    third = Node.new(3)
    fourth = Node.new(2)
    fifth = Node.new(5)

    head.next = second
    second.next = third
    third.next = fourth
    fourth.next = fifth

    head = pivot_around_node(head,3)
    node = head

    until node.value == 3
      expect(node.value).to be < 3
      node = node.next
    end

    expect(node.value).to eq 3
    node = node.next

    until node.nil?
      expect(node.value).to be > 3
      node = node.next
    end
  end
end