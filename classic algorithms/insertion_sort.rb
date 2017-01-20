require 'rspec/autorun'

def insertion_sort(array)
  return array if array.length <= 1

  for i in 1..(array.length - 1)
    for j in (i - 1).downto(0)
      if array[j] > array[i]
        temp = array[i]
        array[i] = array[j]
        array[j] = temp

        #Update i to point to our new value
        i = j
      end
    end
  end

  return array
end

RSpec.describe 'insertion_sort' do
  it 'sorts the array' do
    array = [16, 2, 4, 12, 6, 8, 10, 14]
    array_b = [ 3, 2, 1]
    insertion_sort(array)
    insertion_sort(array_b)

    expect(array).to eq [2,4,6,8,10,12,14,16]
    expect(array_b).to eq [1, 2, 3]
  end
end