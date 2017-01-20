require 'matrix'
require 'set'
require 'rspec/autorun'

class MutuableMatrix < Matrix
  def []=(i,j,x)
    @rows[i][j] = x
  end
end

def zero_column_row(matrix)
  
  zero_rows = Set.new
  zero_columns = Set.new
  
  for i in 0..(matrix.row_count - 1)
    
    next if zero_rows.include?(i)
    
    for j in 0..(matrix.column_count - 1)
      next if zero_columns.include?(j) 
      
      if matrix[i,j] == 0
        zero_rows.add(i)
        zero_columns.add(j)
      end
    end
  end
  
  zero_rows.each do |row|
    for i in 0..(matrix.column_count - 1)
      matrix[row, i] = 0
    end
  end
  
  zero_columns.each do |column|
    for i in 0..(matrix.row_count - 1)
      matrix[i, column] = 0
    end
  end

end

RSpec.describe MutuableMatrix do
  describe "#[]=" do
    it "sets value at location" do
      matrix = MutuableMatrix[[1,2], [2,3]]
      matrix[0, 1] = 7
      
      expect(matrix[0, 1]).to eq 7
    end
  end
end

RSpec.describe "zero_row_column" do
  it "sets entire row or column to zero if zero exists within it" do
    matrix = MutuableMatrix[[1,2,3,8], [4,0,6,9]]
    
    zero_column_row(matrix)
    
    expect(matrix).to eq MutuableMatrix[[1,0,3,8],[0,0,0,0]]
  end
end