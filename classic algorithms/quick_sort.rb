require 'rspec/autorun'
require 'pry'

def quick_sort(array)
  def quick_sort_rec(low, high, array)
    if low >= high
      return array
    end

    pivot = partition(low, high, array)
    quick_sort_rec(low, pivot - 1, array)
    quick_sort_rec(pivot + 1, high, array)
  end

  def partition(low, high, array)
    pivot = low

    while (low < high)

      #Position elements around pivot
      if array[low] < array[high]
        swap(pivot, low, array)
        pivot += 1
      end

      low += 1
    end

    #Swap last element
    swap(pivot, high, array)

    return pivot
  end

  def swap(a, b, array)
    tmp = array[a]
    array[a] = array[b]
    array[b] = tmp
  end

  return quick_sort_rec(0, array.length - 1, array)
end

#Reducing worst case..Sedgewick, randomizing first.. selection median of 3 values?
#Quick sort and duplicates.. it suffers, djiktra's solution?
#Using Insertion sort to sort if length is 12 or less.

RSpec.describe 'quick_sort' do
  it "sorts the array" do
    array = [16, 2, 4, 12, 6, 8, 10, 14]
    array_b = [ 3, 2, 1]
    quick_sort(array)
    quick_sort(array_b)

    expect(array).to eq [2,4,6,8,10,12,14,16]
    expect(array_b).to eq [1, 2, 3]
  end
end
