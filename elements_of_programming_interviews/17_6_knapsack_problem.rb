#Knacksack 1/0 problem

class Knapsack
  include Enumerable

  attr_reader :capacity

  def initialize(capacity)
    @capacity = capacity
    @items = []
  end

  def value
    @items.inject(0) { |t,i| t + i.value }
  end

  def weight
    @items.inject(0) { |t,i| t + i.weight }
  end

  def add_item(item)
    if item.weight + weight > @capacity
      raise "Cannot add #{item.name}, at fully capacity"
    end

    @items << item
  end

  def each(&block)
    @items.each do |i|
      block.call(i)
    end
  end
end

class Item
  include Comparable

  attr_reader :name, :value, :weight

  def initialize(name, value, weight)
    @name, @value, @weight = name, value, weight
  end

  def <=>(other_item)
    @name <=> other_item.name
  end
end

#returns knapsack of capacity with the highest total value
def most_valuable_knapsack_brute(items, capacity)
  included_items = []

  knapsack_rec(items, [], 0, included_items, capacity)

  knapsack = Knapsack.new(capacity)
  included_items.each do |i|
    knapsack.add_item i
  end

  knapsack
end

def knapsack_rec(items, curr, index, included_items, capacity)
  if index >= items.length
    new_value = curr.inject(0) { |t,i| t + i.value }
    prev_value = included_items.inject(0) { |t, i| t + i.value }

    if new_value > prev_value
      included_items.clear
      curr.dup.each do |i|
        included_items << i
      end
    end

    return
  end

  weight = curr.inject(0) { |t, i| t + i.weight }
  if weight + items[index].weight <= capacity
    curr.push items[index]
    knapsack_rec(items, curr, index + 1, included_items, capacity)
    curr.pop
  end

  knapsack_rec(items, curr, index + 1, included_items, capacity)
end

#returns knapsack of capacity with the highest total value
def most_valuable_knapsack_value(items, capacity)
  included_items = []

  values = Array.new(capacity + 1, 0 )

  (0...items.length).each do |i|
    w = capacity

    while(w >= items[i].weight)
      values[w] = [values[w], values[w - items[i].weight] + items[i].value].max
      w -= 1
    end
  end

  values[capacity]
end

items = [Item.new("A", 65, 20),
        Item.new("B", 35, 8),
        Item.new("C", 245, 60),
        Item.new("D", 195, 55),
        Item.new("E", 65, 40),
        Item.new("F", 150, 70),
        Item.new("G", 275, 85),
        Item.new("H", 155, 25),
        Item.new("I", 120, 30),
        Item.new("J", 320, 65),
        Item.new("K", 75, 75),
        Item.new("L", 40, 10),
        Item.new("M", 200, 95),
        Item.new("N", 100, 50),
        Item.new("O", 220, 40),
        Item.new("P", 99, 10)]

puts "Brute:"
knapsack =  most_valuable_knapsack_brute(items, 130)
knapsack.each do |i|
  puts "#{i.name} #{i.value} #{i.weight}"
end

weight = knapsack.inject(0) { |t,i| t + i.value }
puts "total weight: #{weight}"

puts "\nDP: Most valuable Knapsack"
puts most_valuable_knapsack_value(items, 130)



