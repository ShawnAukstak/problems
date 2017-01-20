require 'matrix'
require 'rspec/autorun'

class MutuableMatrix < Matrix
  def []=(i, j, x)
    @rows[i][j] = x
  end
end

class MatrixRotator
  def self.rotate(matrix)

    n = matrix.row_count
    #There are n / 2 layers to rotate..
    for layer in 0..((n / 2) - 1)
       first = layer
       last = n - layer - 1

      for i in first..last - 1
        offset = i - layer

        top = matrix[first, i]
        
        #left -> top
        matrix[first, i] = matrix[last - offset, first]
        
        #bottom -> left
        matrix[last - offset, first] = matrix[last, last - offset]
        
        #right -> bottom
        matrix[last, last - offset] = matrix[i, last]
       
        #top -> right
        matrix[i, last] = top
      end
    end

    return matrix
  end
end

RSpec.describe MutuableMatrix do
  describe "[]=" do
    it "assigns value to location" do
      matrix = MutuableMatrix[[1,2], [3,4]]
      matrix[0, 1] = 13
      expect(matrix[0, 1]).to eq 13
    end
  end
end

RSpec.describe MatrixRotator do
  describe "rotate" do
    it "rotates the matrix 90 degrees clockwise" do
      matrix = MutuableMatrix[[1,2,3],[4,5,6],[7,8,9]]
      rotated_matrix = MutuableMatrix[[7, 4, 1], [8, 5, 2], [9, 6, 3]]
      
      #create larger matrix to test
      expect(MatrixRotator::rotate(matrix)).to eq rotated_matrix
    end
  end
end


