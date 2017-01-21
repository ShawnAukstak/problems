require 'pp'



def column_id(spreadsheet_id)
  column_id = 0

  spreadsheet_id.each_char do |c|
    column_id = (column_id * 26) + (c.ord - "A".ord + 1)
  end

  column_id
end


puts column_id("A")
puts column_id("Z")
puts column_id("AA")
puts column_id("AB")
puts column_id("ZZ")
