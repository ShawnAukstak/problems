require 'rspec/autorun'

def binary_search(value, array)

  def binary_search_rec(low, high, value, array)
    return false if low >= high

    mid = low + ((high - low) / 2)

    if array[mid] == value
      return mid
    elsif value > array[mid]
      binary_search_rec(mid + 1, high, value, array)
    else
      binary_search_rec(low, mid - 1, value, array)
    end

  end

  return false if array.nil? || array.length == 0
  return binary_search_rec(0,array.length - 1, value, array)
end


RSpec.describe 'binary_search' do
  it "returns index" do
    array = [2,4,6,8,10,12]

    expect(binary_search(6,array)).to eq 2
    expect(binary_search(7,array)).to eq false

    array = [2,4,6,8,10]
    expect(binary_search(6, array)).to eq 2
  end
end