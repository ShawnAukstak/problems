class Bitonic

  def initialize(array)
    @array = array
  end

  def exists_in_array(number)

    return false
  end
end


#create two arrays,
  #ascending half and descending half.

puts Bitonic.new([-5, -2, 0, 5, 10, 500, 400, 150, 10, 0, -100]).exists_in_array(400)?

