class Rectangle
  attr_reader :x, :y, :width, :height

  def initialize(params)
    @x, @y, @width, @height = params[:x], params[:y], params[:width], params[:height]
  end

  def intersect?(b)
    (@x + @width > b.x && b.x > @x || b.x + b.width > @x && @x > b.x) &&
    (@y + @height > b.y && b.y > @y || b.y + b.height > @y && @y > b.y)
  end
end

def rectangle_intersection(a,b)
  return Rectangle.new(x: 0, y: 0, width: 0, height: 0) if !a.intersect?(b)

  Rectangle.new(
    x: [a.x, b.x].max,
    y: [a.y, b.y].max,
    width: [a.x + a.width, b.x + b.width].min - [a.x, b.x].max,
    height: [a.y + a.height, b.y + b.height].min - [a.y, b.y].max,
  )
end

a = Rectangle.new x: 1, y: 1, height:4, width:4
b = Rectangle.new x: 2, y: 2, height:2, width:2

puts a.intersect?(b)
inter = rectangle_intersection(a,b)
puts "#{inter.x} #{inter.y} #{inter.width} #{inter.height}"
