class Interval
  attr_accessor :left, :right, :left_open, :right_open

  def initialize(args)
    @left, @left_open, @right, @right_open = args[:left], args[:left_open], args[:right], args[:right_open]
  end

  #sort by start or left endpoint
  def <=>(b)
    #open wins tie
    if @left == b.left
      if @left_open
        return 1
      elsif b.left_open
        return 1
      end
    end

    @left <=> b.left
  end

  def to_s
    lo = (@left_open) ? 'o' : 'c'
    ro = (@right_open) ? 'o' : 'c'
    " #{left}#{lo}..#{right}#{ro} "
  end

  private
end

#time complexity is O(nlogn) due to sort step
def interval_union(intervals)
  return [] if intervals.length == 0
  union_intervals = []

  intervals.sort!

  current_union = intervals.first.dup
  (1..intervals.length - 1).each do |i|
    if current_union.right < intervals[i].left
      #Current union ends before next one starts.
      union_intervals << current_union
      current_union = intervals[i].dup

    elsif current_union.right == intervals[i].left
      #below is not right, it MIGHT be an extend.
      if !current_union.right_open || !intervals[i].left_open
        #Endpoint is closed, extend union.
        current_union.right = intervals[i].right
        current_union.right_open = intervals[i].right_open
      else
        #Endpoint open - no overlap.
        union_intervals << current_union
        current_union = intervals[i].dup
      end
    else
      #Interval is within union - extend union.
      current_union.right = intervals[i].right
      current_union.right_open = intervals[i].right_open
    end
  end

  union_intervals << current_union
  union_intervals
end

intervals = [
  Interval.new({ left:13, right:15, left_open:false, right_open: true}),
  Interval.new({ left:1, right:1, left_open:false, right_open: false}),
  Interval.new({ left:2, right:4, left_open:false, right_open: false }),
  Interval.new({ left:3, right:4, left_open:false, right_open: true }),
  Interval.new({ left:0, right:3, left_open:true, right_open: true}),
  Interval.new({ left:7, right:8, left_open:false, right_open:true}),
  Interval.new({ left:8, right:11, left_open:false, right_open: true}),
]

puts intervals
puts "Union:"
puts interval_union(intervals)
