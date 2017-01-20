require 'rspec/autorun'


def merge_sort(array)
  def merge_sort_rec(array)
    return if array.nil?
    return array if array.length <= 1
    
    mid = array.length / 2
    left = merge_sort_rec(array[0,mid])
    right = merge_sort_rec(array[mid, array.length])
    
    return merge(left, right)
  end

  def merge(left, right)
    result = []
    
    while left.length > 0 && right.length > 0
      if left.first < right.first
        result << left.shift
      else
        result << right.shift
      end
    end
    
    until left.length == 0
      result << left.shift
    end
    
    until right.length == 0
      result << right.shift
    end
    
    return result
  end

  return merge_sort_rec(array)
end

RSpec.describe 'merge_sort' do
  it "sorts array" do
    array = [5, 2, 3, 1, 4]
    expect(merge_sort(array)).to eq [1,2,3,4,5]
  end
end