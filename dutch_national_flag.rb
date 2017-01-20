require 'pp'

def dutch_national_flag(a, i)
  pivot = a[i]

  lesser, equal, larger = 0, 0, a.length - 1

  while (equal <= larger)
    if (a[equal] < pivot)
      swap(a, lesser, equal)
      lesser += 1
      equal += 1
    elsif a[equal] == pivot
      equal += 1
    else
      swap(a, equal, larger)
      larger -= 1
    end
  end
end

def swap(a, i, j)
  temp = a[i]
  a[i] = a[j]
  a[j] = temp
end

a = [0,2,4,16,8,2,4,32, -5]
#pivot 4
#lesser 2
#equal 4
#larger 5

pp a
dutch_national_flag(a, 2)
pp a


VALUES = [:one, :two, :three, :four]

class Thing
  attr_reader :value, :values

  def initialize(value)
    @value = value
  end
end

def dnf_things(things)
  # Group into sections by one of the four possible values.

  first, second, third, fourth = 0,0, things.length - 1, things.length - 1

  while second <= third
    if things[second] == VALUES.first
      swap(things,second,first)
    elsif things[second] == VALUES.second
      second += 1
    elsif things[second] == VALUES.third
      swap(things,second,third)
      third -= 1
    else # things[second] == VALUES.fourth

    end

  end
end

def 


a = [Thing.new(:two),Thing.new(:one),Thing.new(:four),Thing.new(:four),Thing.new(:one),Thing.new(:three)]

pp a.map { |t| t.value }
dnf_things(a)
pp a.map { |t| t.value }



