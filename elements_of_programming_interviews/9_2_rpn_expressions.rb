#Takes RPN expression and returns result.
#3 4 5 × − = 3 − 4 × 5

#Input is a string where each operand and each operator is comma separated
def evualate_rpn(rpn)
  operand_stack = Array.new

  exp = rpn.split(',')

  exp.each do |o|

    if o =~ /[\+\-x\/]/

      # 3 4
      # 12 5
      #operation
      y = operand_stack.pop
      x = operand_stack.pop
      operand_stack.push operation(o, x, y)

    elsif o =~ /\d/
      #operand
      operand_stack.push(o.to_i)
    else
      raise "invalid entry #{o} in expression"
    end

  end

  operand_stack.pop
end

#Do operation, e.g. x - y
def operation(o, x, y)
  case o
    when '+'
      x + y
    when '-'
      x - y
    when 'x'
      x * y
    when '/'
      x / y
    else
      raise "invalid operation #{o}"
  end
end

puts evualate_rpn("3,4,5,x,-")
puts evualate_rpn("3,4,+,2,x,1,+")
