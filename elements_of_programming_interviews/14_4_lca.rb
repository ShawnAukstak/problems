

    1
  2   3
4  5


stack_a = 4,2, 1
stack_b 3, 1

a = 3
lca = 1

def least_common_ancestor(a,b)
  stack_a, stack_b = [], []

 #create stacks
  while a
    stack_a.push a
    a = a.parent
  end

  while b
    stack_b.push b
    b = b.parent
  end

  lca = nil

  #pop stacks until lca
  while (!stack_a.empty? && !stack_b.empty?)
    x = stack_a.pop
    y = stack_b.pop

    if x == y
      lca = x
    else
      break
    end

  end

  return lca
end